
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-062ee72e4f1adca86","subnet-04a6a8bd5bfdbbcb8","subnet-0afe5223c8b013e0f","subnet-075c0dcabcc80ae11"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-062ee72e4f1adca86","subnet-04a6a8bd5bfdbbcb8","subnet-0afe5223c8b013e0f","subnet-075c0dcabcc80ae11"]

        tags = {
             "Name" =  "node1"
         } 
  }
}
