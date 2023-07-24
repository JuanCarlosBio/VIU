package main

import (
    "fmt"
    "os"
    "log"
    "github.com/go-gota/gota/dataframe"
)

func main() {

    file, err := os.Open("text.tsv")
    defer file.Close()
    if err != nil{
        log.Fatal(err)
    }

    df := dataframe.ReadCSV(file)

    fmt.Println(df)

}
