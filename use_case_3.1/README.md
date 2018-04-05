[![logo](../generate_flowchart/flowChartImages/GerberLogo.w100.png)](../README.md)

## TODO : Modularize containers

![alt text](../generate_flowchart/flowChartImages/modular_containers.png)

### Use case 3: Containerized interaction (Nested Workflows)
By containerizing our tools, we can build their respective environments within the same network and therefore guarantee pipeline interaction.

The tools can be invoked in a container environment via CWL. This guarantees modularization, and swapping of tools without directly affecting the parameters of other components. To achieve this, the input and output parameters needs to be defined identically in the replaced modules.

### NOTES
* To unzip file tar -zxvf `filename.zip`
