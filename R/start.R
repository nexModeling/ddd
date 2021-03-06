#' Start
#'
#' Start by building the ddd Object
#' @param namefield nme of the field
#' @param namespace namespace
#' @param pathRes path of the results
#' @keywords ddd
#' @export
#' @examples
#' start(namefield="ddd",namespace="ddd",pathRes="~/")
#'

start <- function(namefield,namespace,pathRes){
  myEnv <- environment()
  pathDir <- pathRes

  myInputParam <- onionR::block(namefield="inputParam",namespace="dddModel",pathRes=pathDir)
  myModel <- onionR::block(namefield="model",namespace="dddModel",pathRes=pathDir)
  myPrecipLZ <- onionR::block(namefield="precipLZ",namespace="dddPrecipLZ",pathRes=pathDir)
  myTempLZ <- onionR::block(namefield="tempLZ",namespace="dddTempLZ",pathRes=pathDir)
  myScaob <- onionR::block(namefield="scaob",namespace="dddScaOb",pathRes=pathDir)
  myQ <- onionR::block(namefield="Q",namespace="dddQ",pathRes=pathDir)
  mySnow <- onionR::block(namefield="snow",namespace="dddSnow",pathRes=pathDir)
  mySnowReservoir <- onionR::block(namefield="snowReservoir",namespace="dddSnow",pathRes=pathDir)
  myEvapotranspiration <- onionR::block(namefield="evapotranspiration",namespace="dddEvapotranspiration",pathRes=pathDir)
  mySoilDischarge <- onionR::block(namefield="soilDischarge",namespace="dddSoilDischarge",pathRes=pathDir)
  mySoilMoisture <- onionR::block(namefield="soilMoisture",namespace="dddSoilMoisture",pathRes=pathDir)
  mySoilWater <- onionR::block(namefield="soilWater",namespace="dddSoilWater",pathRes=pathDir)
  myDdistAll <- onionR::block(namefield="ddistAll",namespace="dddGroundwater",pathRes=pathDir)
  myGroundwater <- onionR::block(namefield="groundwater",namespace="dddGroundwater",pathRes=pathDir)
  myUH <- onionR::block(namefield="uh",namespace="dddUH",pathRes=pathDir)


  dddL <- list(
    inputParam = myInputParam,
    model = myModel,
    precipLZ = myPrecipLZ,
    tempLZ = myTempLZ,
    scaob = myScaob,
    Q = myQ,
    snow = mySnow,
    snowReservoir = mySnowReservoir,
    evapotranspiration = myEvapotranspiration,
    soilDischarge = mySoilDischarge,
    soilMoisture = mySoilMoisture,
    soilWater = mySoilWater,
    ddistAll = myDdistAll,
    groundwater = myGroundwater,
    uh = myUH,
    save = function(name){
      myPrecipLZ$save(name)
      myTempLZ$save(name)
      myScaob$save(name)
      myQ$save(name)
      mySnow$save(name)
      mySnowReservoir$save(name)
      myEvapotranspiration$save(name)
      mySoilDischarge$save(name)
      mySoilMoisture$save(name)
      mySoilWater$save(name)
      myDdistAll$save(name)
      myGroundwater$save(name)
      myUH$save(name)
      invisible()}
  )

  ## Define the value of the list within the current environment.
  assign('this',dddL,envir=myEnv)

  ## Set the name for the class
  class(dddL) <- append("ddd","list")
  return(dddL)
  }
