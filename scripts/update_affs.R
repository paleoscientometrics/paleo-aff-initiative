# Download and merge new references ---------------------------------------

# API: https://paleobiodb.org/data1.2/occs/refs.csv?interval=Ediacaran,Holocene&select=occs

# Get data file for completed affiliations
old_refs <- read.csv(file.path("data_archive", "aff-data-complete.csv"))

new_refs <- read.csv("https://paleobiodb.org/data1.2/occs/refs.csv?interval=Ediacaran,Holocene&select=occs",
					 encoding = "UTF-8")

# which ones haven't been done yet
todo_refs <- new_refs[!new_refs$reference_no %in% old_refs$reference_no,]
todo_refs <- todo_refs[!is.na(todo_refs$pubyr),]

# save data
write.csv(todo_refs, file.path("data_archive", "aff_data-todo.csv"), row.names = FALSE)
write.csv(new_refs, file.path("data_archive", "PBDB_refs.csv"), row.names=FALSE)
