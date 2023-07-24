package main

import (
	"bufio"
	"fmt"
	"github.com/go-gota/gota/dataframe"
	"log"
	"strings"
	"os"
)

func reading_lines(filename string) ([]string, error) {

	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	var lines []string // Declare 'lines' slice before appending lines to it.

	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		return nil, err
	}

	return lines, nil
}

func remove_comments_vep_files(filepath string) error {
    // Open the input file
    inputfile, err := os.Open(filepath)
    if err != nil {
        return err
    }
    defer inputfile.Close()

    // Create a new file to store the modified content
    outputfile, err := os.Create(filepath + ".tmp")
    if err != nil {
        return err
    }
    defer outputfile.Close()

    scanner := bufio.NewScanner(inputfile)
    writer := bufio.NewWriter(outputfile)

    for scanner.Scan() {
        line := scanner.Text()
        if !strings.HasPrefix(line, "##") {
            _, err := writer.WriteString(line + "\n")
            if err != nil {
                return err
            }
        }
    }

    if err := scanner.Err(); err != nil {
        return err
    }

    err = writer.Flush()
    if err != nil {
        return err
    }

    inputfile.Close()
    outputfile.Close()

    err = os.Rename(filepath+".tmp", filepath)
    if err != nil {
        return err
    }

    return nil
}

func col_sample(filepath string) error {
	
	// Open the input file
    inputfile, err := os.Open(filepath)
    if err != nil {
        return err
    }
    defer inputfile.Close()

    // Create a new file to store the modified content
    outputfile, err := os.Create(filepath + ".tmp")
    if err != nil {
        return err
    }
    defer outputfile.Close()

    scanner := bufio.NewScanner(inputfile)
    writer := bufio.NewWriter(outputfile)

    // Process the header line and add the "sample" column
    if scanner.Scan() {
        header := scanner.Text()
        modifiedHeader := header + ",sample\n"
        _, err := writer.WriteString(modifiedHeader)
        if err != nil {
            return err
        }
    }

    for scanner.Scan() {
        line := scanner.Text()
        modifiedLine := line + ",SRR1\n"
        _, err := writer.WriteString(modifiedLine)
        if err != nil {
            return err
        }
    }

    if err := scanner.Err(); err != nil {
        return err
    }

    // Flush the writer to ensure all data is written to the file
    err = writer.Flush()
    if err != nil {
        return err
    }

    // Close the input file and output file
    inputfile.Close()
    outputfile.Close()

    // Replace the original file with the modified one
    err = os.Rename(filepath+".tmp", filepath)
    if err != nil {
        return err
    }

    return nil
}

func main() {

	lines, err := reading_lines("seq.txt")
	if err != nil {
		fmt.Println("Error reading the file", err)
		return
	}

	fmt.Println(lines)

	for _, line := range lines{

		filepath := fmt.Sprintf("notas_%s.txt", line)

		err := remove_comments_vep_files(filepath)
		if err != nil{
			fmt.Println("Error: ", err)
		} else {
			success_comment := fmt.Sprintf("===> Comments of the VEP sample %s files have benn deleted <===", line)
			fmt.Println(success_comment)
		}

		file, err := os.Open(filepath)

		if err != nil {
			log.Fatal(err)
		}

		df := dataframe.ReadCSV(
			file, 
			dataframe.HasHeader(true), 
			dataframe.WithDelimiter('\t'),
			)	
		
		fil := df.Filter(dataframe.F{2, "asignatura", "==", "Biologia"})

		fmt.Println(fil)
		
		path_results := fmt.Sprintf("filtered_notas_%s.tsv", line)
		outputfile, err := os.Create(path_results)

		if err != nil {
			log.Fatal(err)
		}
		defer outputfile.Close()

		if err := fil.WriteCSV(outputfile); err != nil {
			log.Fatal(err)
		}

		err = col_sample(path_results) // Use the existing 'err' variable
        if err != nil {
            fmt.Println("Error: ", err)
        } else {
            success_col_generation := fmt.Sprintf("===> Adding sample: %s column <===", line)
            fmt.Println(success_col_generation)
        }
	}
}