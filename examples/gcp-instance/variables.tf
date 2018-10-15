#Name of the system.
variable "name" {
  default = "test"
}

variable "densify_recommendations" {
  type = "map"
  #sample map of map this would be generated by densify provided as a .auto.tfvars file that would have all the systems and info listed. 
  #In the file there would be multiple systems defined in this case it just has 1 called test. 
  #To see how it would work you can change the approvalType from all to na. As all assumes you have approved all changes and na would be used to say haven't approved the change and just want to make the system self-aware. 
  default = { 
    test = {
      recommendedType = "n1-standard-1"
      currentType = "n1-standard-2"
      approvalType = "all"
      savingsEstimate = "26.6"
      predictedUptime = "94.32"
      reservedInstanceCoverage = "yes"
    }
  }
}

# Defaults this is used for fallback if the system name isn't found in the densify_recommendations. 
# This shouldn't be used in most cases likely use would be if you were to create a new system that hasn't been analyzed by Densify yet.
variable "densify_default"{
  type = "map"
  default = {
	recommendedType = "n1-standard-2"
	currentType = "n1-standard-2"
	approvalType = "all"
	savingsEstimate = "0"
	predictedUptime = "0"
	reservedInstanceCoverage = "no"
  }
}