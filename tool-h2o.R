library(h2o)
h2o.init(max_mem_size = "30g", nthreads = -1)

dx_train <- h2o.importFile("train-10m.csv")
p <- ncol(dx_train)-1

tm <- system.time({
  md <- h2o.gbm(training_frame = dx_train, x = 1:p, y = p+1, 
                max_depth = 10, learn_rate = 0.1, nbins = 100, 
                ntrees = 1, seed = 123)
})
tm

h2o.shutdown(prompt = FALSE)
Sys.sleep(5)

cat(tm[[3]],"\n")
