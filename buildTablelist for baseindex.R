# 基本指标下载，列表建立

library(jsonlite)
library(magrittr)

loadTable <- function(url,tab_id){
  df <- url %>% fromJSON
  table <- df[tab_id,"data"]
}


### 深圳交易所基本指标表单下载
buildTableList <- function(table_id,start_date,days){
  dayls <- subset(days, days>=start_date)
  
  daynum <- length(dayls)
  
  start_url <- "http://www.szse.cn/api/report/ShowReport/data?SHOWTYPE=JSON&CATALOGID=1803&TABKEY=tab"
               
  date_url <- "&txtQueryDate="
  
  tables.list <- list()
  
  if(daynum >= 1){
    
    for(i in 1:daynum)
      tables.list[i] <- loadTable(paste(start_url,table_id,date_url,dayls[i],sep = ""),table_id)

    names(tables.list) <- dayls
  
  }
 
  return(tables.list)
  
}
