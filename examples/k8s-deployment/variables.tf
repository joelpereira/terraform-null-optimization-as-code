#Name of the system.
variable "name" {
  default = "test-deployment"
}

variable "densify_recommendations" {
  type = map(map(string))
  #sample map of map this would be generated by densify provided as a .auto.tfvars file that would have all the systems and info listed. 
  #In the file there would be multiple systems defined in this case it just has 1 called test-deployment. 
  #To see how it would work you can change the approvalType from all to na. As all assumes you have approved all changes and na would be used to say haven't approved the change and just want to make the system self-aware. 
  default = { 
    test-deployment = {
      recommendedCpuRequest = "40m"
	  recommendedMemRequest = "128Mi"
	  recommendedCpuLimit = "80m"
	  recommendedMemLimit = "256Mi"
	  currentCpuRequest = "50m"
	  currentMemRequest = "256Mi"
	  currentCpuLimit = "100m"
	  currentMemLimit = "512Mi"
      approvalType = "all"
    }
  }
}

# Defaults this is used for fallback if the system name isn't found in the densify_recommendations. 
# This shouldn't be used in most cases likely use would be if you were to create a new system that hasn't been analyzed by Densify yet.
variable "densify_fallback"{
  type = map(string)
  default = {
	recommendedCpuRequest = "50m"
	recommendedMemRequest = "256Mi"
	recommendedCpuLimit = "100m"
	recommendedMemLimit = "512Mi"
	currentCpuRequest = "50m"
	currentMemRequest = "256Mi"
	currentCpuLimit = "100m"
	currentMemLimit = "512Mi"
    approvalType = "all"
  }
}