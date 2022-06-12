library(ggplot2)

# Data frame with 234 rows and 11 variables
head(mpg)


# Histogram
pl <- ggplot(data = mpg, aes(x = displ))
pl + geom_histogram(color = "white", fill = "blue", binwidth = 0.5, alpha = 0.8) + labs(x = "Engine Displacement", y = "Count")

# Bar Plot
pl <- ggplot(data = mpg, aes(manufacturer, fill = factor(cyl)))
pl + geom_bar() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


# Data frame with 8602 observations and 9 variables
head(txhousing)

# Scatter Plot
pl <- ggplot(data = txhousing, aes(x = volume, y = sales))
pl + geom_point(aes(color = year)) + geom_smooth(method = "auto", formula = y~s(x), color = "red")

# Box Plot
pl <- ggplot(data = head(txhousing, 100), aes(x = factor(year), y = inventory))
pl + geom_boxplot(color = "black", fill = "purple")


# Pie Chart
df <- data.frame(value = c(10,23,15,18), group = paste0("G", 1:4))
ggplot(df, aes(x = " ", y = value, fill = group)) + geom_col(color = "black") + geom_text(aes(label = value), position = position_stack(vjust = 0.5)) + coord_polar(theta = "y") + scale_fill_manual(values = c("#BE2A3E", "#EC754A", "#EACF65", "#3C8D53"))

# Heat Map
library(reshape)
set.seed(8)
m <- matrix(round(rnorm(200), 2), 10, 10)
colnames(m) <- paste("Col", 1:10)
rownames(m) <- paste("Row", 1:10)
df <- melt(m)
colnames(df) <- c("x", "y", "value")
ggplot(df, aes(x = x, y = y, fill = value)) + geom_tile(color = "black") + scale_fill_gradientn(colors = hcl.colors(20, "RdYlGn")) + coord_fixed() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


