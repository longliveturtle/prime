txt <- readLines(con = "grand.bib")

grep(pattern = "file    =",
     x = txt,
     value = FALSE) -> index_ok

grep(pattern = "file    =",
     x = txt,
     value = TRUE) -> ok_1

gsub(pattern = "file    =",
     replacement = "url    =",
     x = ok_1) -> ok_2

gsub(pattern = ":PDF",
     replacement = "",
     fixed = TRUE,
     x = ok_2) -> ok_3

gsub(pattern = ":F\\:/VAULT12/",
     replacement = "https://longliveturtle.github.io/prime/",
     fixed = TRUE,
     x = ok_3) -> ok_4

ok_4

for(i in 1:length(index_ok)){
  
  grep(pattern = "file    =",
       x = txt,
       value = FALSE) -> index_ok
  
  txt <- append(txt, 
                   values = ok_4[i], 
                   after = index_ok[i] - 1)
 
  
  
}

### rà lại url bị trùng
check_all <- vector()

for(j in 1:length(txt)){
  
  check <- identical(txt[j], txt[j+1])
  
  check_all <- append(check_all, check)
  
}

check_all

txt[which(!check_all)] -> txt_yes

txt <- readLines(con = "grand.bib")

identical(txt, txt_yes)

txt_yes

writeLines(txt_yes, con = "grand.bib")

############

library(pdftools)

pdf_file <- list.files(recursive = TRUE,
                       pattern = "\\.pdf")

pdf_clean <- list()

for(p in 1:length(pdf_file)) {
  
  pdftools:::pdf_info(pdf = pdf_file[p]) -> ok_pdf
  
  pdf_clean <- append(pdf_clean, ok_pdf)
  
}

pdf_clean

















