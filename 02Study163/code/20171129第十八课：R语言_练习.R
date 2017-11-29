
# 更改变量中的数值 ####
ID<-c(1:13)
Col<-c('a','a','a','ac','ac','ac','a','a','ac','a','ac','a','a')
new_data<-data.frame(ID,Col)
new_data[,2]<-as.character(new_data[,2])
new_data$Col[which(new_data$Col=='a')]<-'b'
new_data

# 任务2-20171128-云课堂2017年收入数据统计与分析 ####
# 下载并导入数据 ####
library(rJava)
library(xlsx)
library(xlsxjars)
setwd('D:/Rstudy/02Study163/data')

ss01<-read.xlsx(file = '01.xlsx',sheetName = 'sheet1',header = TRUE,encoding = 'UTF-8')
ss02<-read.xlsx(file = '02.xlsx',sheetName = 'sheet1',header = TRUE,encoding = 'UTF-8')
ss03<-read.xlsx(file = '03.xlsx',sheetName = 'sheet1',header = TRUE,encoding = 'UTF-8')
ss04<-read.xlsx(file = '04.xlsx',sheetName = 'sheet1',header = TRUE,encoding = 'UTF-8')
ss_data<-rbind(ss01,ss02,ss03,ss04)

# 用sqldf函数对数据进行透视分析 ####
library(sqldf)

# 变量重命名
names(ss_data)
names(ss_data)<-c('ID','time','type','name','describe',
                         'original cost','dealing_price','customer','promotion','promotion_name',
                         'plat red','user_paid','paid_way','third_paid','promotion_paid',
                         'sever_paid','actual_income','ex_state','ex_time','arrival_state',
                         'arrival_time')

# 提取交易成功的订单
ss_s<-sqldf("select * from ss_data where ex_state in ('交易成功')")
# 中文变量名出现乱码，怎么解决？？

# 数据拆分
install.packages('data.table')
library(data.table)
ss_spl<-tstrsplit()


# 在完整数据中提取十一月交易成功的订单
ss_s11<-sqldf('select * from ss_s where time like '2017%'')


# 提取课程和实际收入
ss_inc1<-sqldf('select * from ss_s where ')

# 用subset函数进行数据透视表 ####
# 选取交易成功的订单 
ss_d<-subset(ss_data,ex_state=='交易成功',select=c(1:21))

# 提取交易成功的订单课程和实际收入 
ss_inc1<-subset(ss_d,select = c('name','actual_income'))

# 用长宽表转换对ss_inc1做数据透视表 ####
library(reshape2)
ss_re<-dcast(ss_inc1,name~actual_income)







