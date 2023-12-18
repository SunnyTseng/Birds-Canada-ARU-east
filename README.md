ARU data processing on BirdNET for Birds Canada
================
Sunny Tseng

## Introduction

The ARU data was collected by Birds Canada during 2017 to 2019 breeding
season in eastern Canada. The goal of this repository is to analyzing
all the ARU recordings that collected from this project through BirdNET,
and provide detection information for each of the ARU.

## Workflow

*This session is still under developing*

[working note](./docs/working-notes.md)

1.  Data organization
2.  Data exploration
3.  Processing data through BirdNET GUI
4.  Data wrangling and cleaning
5.  Final summarizing

## BirdNET Analyzer GUI settings

All the analysis will be done on [BirdNET
Analyzer](https://github.com/kahst/BirdNET-Analyzer) GUI on Windows. The
model version that used in the GUI is
*BirdNET_GLOBAL_6K_V2.4_Model_FP32.tfile*.

- Species by location tab
  - latitude: base on site location
  - longitude: base on site location
  - week: based on recording time
- Inference settings
  - Minimum confidence: 0.5 (default)
  - Sensitivity: 1 (default)
  - Overlap: 0 (default)
- Other settings
  - Result type: R
  - Batch size: 4
  - Threads: 4

## Output format

- One excel file will be produced for each site, each ARU, with the
  following naming rule: `site_location_aruid.csv`

- Each row of the data frame represents single BirdNET detection

- Columns of the data set are explained below:

| Column name     | Description                                                                                                              |
|-----------------|--------------------------------------------------------------------------------------------------------------------------|
| site            | the site name of ARU employment, one of the 21 sites                                                                     |
| location        | value being 1 or 2. The first or the second location of ARU within each site                                             |
| aru_id          | a 4 digits number. Unique ID of each ARU unit                                                                            |
| date            | the date of detection, with the format yyyymmdd                                                                          |
| hour            | the hour of detection                                                                                                    |
| start           | within a specific recording, where is the start time of the detection                                                    |
| end             | within a specific recording, where is the end time of the detection                                                      |
| scientific_name | scientific name of the detected species                                                                                  |
| common_name     | common name of the detected species                                                                                      |
| confidence      | confidence value for the detection provided by BirdNET. Higher confidence corresponded to higher probability of presence |
| filepath        | file path of the original recording file                                                                                 |

## Processing schedule

| Site                  | Location ID | ARU ID | Date   | Time          | Output | Note |
|-----------------------|-------------|--------|--------|---------------|--------|------|
| Baie Verte Port Elgin | NB43-04     | 6      | Dec.15 | 11:47 - 12:19 |        |      |
| Baie Verte WFP        | NB44-01     | 7      | Dec.15 | 14:52 - 15:33 |        |      |
| Beaubassin            | NA          | 16     | Dec.15 | 15:37 - 17:19 |        |      |
