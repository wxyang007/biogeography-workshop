# day 2: 12/12
library(ape)
tree <- read.tree(text = "(A:2, ((D:4, C:1):1, B:2):3);")
plot(tree)

log(2, base=10)

# paleontology/paleobiology??? database
# fossil occurrences
library()
heteromorphs <- read.csv("https://dev.paleobiodb.org/data1.2/taxa/list.txt?name=Ancyloceratina&rel=all_children")
dim(heteromorphs)
read.csv("https://dev.paleobiodb.org/data1.2/taxa/list.txt?taxon_id=129648")

# ammonites

# we want to takte a data set
    # get all the parent ids (unique)
        # get info for parents not included
    # get all the parent ids of the parent Ids
        # get all the parent ids not included
    # get all the parent ids of the parents
        # get all the parent ids not included

# we need a function

getStartingData <- function(cladeName){
    read.csv(paste0(
        "https://deve.paliodb.org/data1.2/taxa/list.txt?taxon_name=", 
        cladeName, "&rel=all_children")
    )
}

getStartingTaxaData <- function(cladeName){
    read.csv(paste0(
        "https://deve.paliodb.org/data1.2/taxa/list.txt?taxon_name=", 
        cladeName)
    )
}

startingTaxon <- getStartingTaxaData(groupName)
startingFullData <- getStartingData(groupName)

getTaxonID <- function(taxonID){
    # function we give id to and get taxon info
    # input: taxonID
    # output: a data frame
    
    read.csv(paste0(
        "https://deve.paliodb.org/data1.2/taxa/list.txt?taxon_id=", 
        taxonID)
        )
}


getUniqueTaxa <- function(fullData){
    unique(fullData$taxon_no)
}

getUniqueParents <- function(fullData){
    unique(fullData$parent_no)
}

function(dataFull, startingTaxonInfo){
    taxaList <- getUniqueTaxa(dataFull)
    parentList <- getUniqueParents(dataFull)
    
    parentList <- parentList[
        parentList$parent_no!=startingTaxonInfo$parent_no]
    missingThings <- check_IDs(parentList, taxaList)
    if(length(missingThings)>0){
        dataFull <- addMissingTaxa(dataFull, missingThings)
    }
    
    if()
    ]
}



taxalist <- getUniqueTaxa(dataFull)
parentList <- getUniqueParents(dataFull)
# we need to include the root taxon number
missingThings <- check_IDs(parentList, taxaList)
if(length(missingThings)){}

check_IDs <- function(listIDs, fullIds){
    missing <- character()
    for(i in 1:listIDs){
        if(all(fullIDs != listIDs[i])){
            missing[length(missing)+1] <- listIDs[i]
        }
    }
    return(missing)
}


addMissingTaxa <- function(fullData, missingIDs){
    # we want to take full data set and add on the missing taxa
    for(i in 1:length(missingIDs)){
        addThis <- getTaxonID(missingIDs[i])
        if(nrow(addThis) < 1){
            stop(paste0("couldn't find a parent taxon: "),
                 missingIDs[i])
            }
        fullData <- rbind(fullData, addThis)
    }
    return(fullData)
}
