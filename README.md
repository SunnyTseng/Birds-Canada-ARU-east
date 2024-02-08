ARU data processing on BirdNET for Birds Canada (east)
================

## Introduction

The ARU data was collected by Birds Canada during 2017 to 2019 breeding
season in eastern Canada. The goal of this repository is to analyzing
all the ARU recordings that collected from this project through BirdNET,
and provide detection information for each of the ARU.

## Workflow

1.  Data organization
2.  Data exploration
3.  Processing data through BirdNET GUI
4.  Data wrangling and cleaning
5.  Final summarizing

## BirdNET Analyzer GUI settings

All the analyses were done on [BirdNET
Analyzer](https://github.com/kahst/BirdNET-Analyzer) GUI on Windows. The
model version that used in the GUI is
*BirdNET_GLOBAL_6K_V2.4_Model_FP32.tfile*.

- Species by location tab
  - latitude: base on site location
  - longitude: base on site location
  - week: based on recording time, calculated by this [date
    calculater](https://www.timeanddate.com/date/weeknumber.html)
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
| location        | ID for the site, starting with “NB”                                                                                      |
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

- [Working note](./docs/working-notes.md)

| Site                  | Location ID | ARU ID | Processing date | Time          | Output                                                  | Note                      |
|-----------------------|-------------|--------|-----------------|---------------|---------------------------------------------------------|---------------------------|
| Baie Verte Port Elgin | NB43-03     | 20     | Jan.04          | 10:28         |                                                         | error - file corrupted    |
| Baie Verte Port Elgin | NB43-04     | 6      | Dec.15          | 11:47 - 12:19 | [file](./data/cleaned/BaieVertePortElgin_NB43-04_6.csv) |                           |
| Baie Verte WFP        | NB44-01     | 7      | Dec.15          | 14:52 - 15:33 | [file](./data/cleaned/BaieVerteWFP_NB44-01_7.csv)       |                           |
| Baie Verte WFP        | NB44-09     | 1      | Jan.14          | 20:50 - 21:14 | [file](./data/cleaned/BaieVerteWFP_NB44-09_1.csv)       | one single file corrupted |
| Beaubassin            | NA          | 16     | Dec.15          | 15:37 - 17:19 |                                                         |                           |
| Beaubassin            | NB35-01     | 4      | Jan.04          | 10:28 - 11:01 |                                                         |                           |
| Beaubassin            | NB35-04     | 4      | Jan.04          | 11:23 - 12:05 |                                                         |                           |
| East Amherst Marsh    | NS02-02     | 1      | Jan.04          | 12:31 - 13:07 |                                                         |                           |
| East Amherst Marsh    | NS02-05     | 7      | Jan.05          | 11:28 - 12:24 |                                                         |                           |
| Fredericton           | NB05-04     | 15     | Jan.05          | 10:39         |                                                         | error - file corrupted    |
| Fredericton           | NB05-1-2    | 15     | Jan.05          | 15:41 - 18:03 |                                                         |                           |
| Gagetown Island       | NB11-06     | 23     | Jan.06          | 22:28         |                                                         | error - file corrupted    |
| Holden Meadow         | NB13-11     | 20     | Jan.05          | 10:51 - 11:14 |                                                         |                           |
| Midgic                | NB38-02     | 3      | Jan.05          | 12:24 - 12:59 |                                                         |                           |
| Midgic                | NB38-06     | 12     | Jan.05          | 12:59 - 13:49 |                                                         |                           |
| Musquash              | NB51-02     | 11     | Jan.06          | 22:32 - 23:47 |                                                         |                           |
| Petitcodiac           | NB41-02     | 3      | Jan.08          | 14:15 - 15:23 |                                                         | one single file corrupted |
| Portobello Center     | NB20-03     | 18     | Jan.14          | 6:16 - 7:13   |                                                         |                           |
| St George             | NB32-04     | 20     | Jan.14          | 17:22 - 19:36 |                                                         |                           |
| Tintamarre            | NB34-01     | 2      | Jan.05          | 13:49 - 14:24 |                                                         |                           |
| Tintamarre            | NB34-05     | 1      | Jan.14          | 21:44 - 22:21 |                                                         | one single file corrupted |
| Titamarre             | NB34-8-9    | 14     | Jan.04          | 14:08 - 14:26 |                                                         |                           |
| Ward                  | NB36-03     | 13     | Jan.04          | 14:52 - 15:59 |                                                         |                           |
| Westcock              | NB37-01     | 21     | Jan.04          | 14:16         |                                                         | error - file corrupted    |
