#获取交易日期向量
library(magrittr)

Getdaylist <- function(dir){
  all_stock <- list.files(dir)
  
  path <- paste(dir, head(all_stock), sep = "")
  
  #获取日期函数
  GetDate <- function(path){
    dates <- read.table(path, header = T, skip = 1, stringsAsFactors = F)[[1]]
    
    return(dates)
  }
  
  getday.list <- lapply(path, GetDate)
  
  getday <- unlist(getday.list)
  
  unique_date <- getday %>% unique %>% sort %>% as.Date
  
  return(unique_date)
}
