import networkx as nx
import matplotlib.pyplot as plt
from more_itertools import pairwise

def create_cyclic_nodes(l):
    return [*pairwise(l)] + [(l[-1], l[0])]

nodes = create_cyclic_nodes(["A", "B", "C", "D"])
graph = nx.DiGraph(nodes) 
pos = nx.spring_layout(graph)

nx.draw_networkx(graph, pos=pos, cmap=plt.get_cmap('jet'))

plt.show()
