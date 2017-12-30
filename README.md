# Optics Clustering 

---
## Description
Soving clustering problems using Optics Algorithm
## Usage
- **Script** **Explaination**

    opticsClusterMy.m -- main interface of the code
    
    findClustersFromRD.m -- find boundarys between different clusters from RD bar
    
    cluster_potics.m -- script of the optics algorithm
- **example data**
    
    julei1.mat julei2.mat
- **Run**
    
```
datasetNum = 2;

if datasetNum == 1
    datasetName = 'julei1';
    downsamplerate = 1;
else
    datasetName = 'julei2';
    downsamplerate = 5;
end

```
   Change the datasetNum, and then run the script opticsClusterMy.m 
   
   Or in order to get the result faster, just run the script findClustersFromRD.m directly.
   
##    Result
![image](https://github.com/DemingWang/optics-cluster/blob/master/julei1.png) ![image](https://github.com/DemingWang/optics-cluster/blob/master/julei2.png)
