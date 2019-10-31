// Challenge 1
// Write test cases including boundary conditions for given challenges

// Challenge 2
// Josephus Problem
// This classic problem dates back to Roman times. There are 41 soldiers arranged
// in a circle. Every third soldier is to be killed by their captors, continuing
// around the circle until only one soldier remains. He is to be freed. Assuming
// you would like to stay alive, at what position in the circle would you stand?

// Generalize this problem by creating a function that accepts the number of
// soldiers n and the interval at which they are killed i, and returns the
// position of the fortunate survivor.
class Node {
  int x;
  Node nextNode;

  Node(this.x);
}

int josephus(int n, int k) {
//create a list of nodes and fill them with numbers 1 to n
  List<Node> nodeList = new List<Node>.generate(
      n, (int index) => new Node(index + 1)); // generate a list of nodes
//link each node to the next node in the list
  for (int i = 0; i < nodeList.length - 1; i++) {
    nodeList[i].nextNode = nodeList[i + 1];
  }
//print(nodeList[2].x);
//print(nodeList[2].nextNode.x);

//link last node to the first node
  nodeList[n - 1].nextNode = nodeList[0]; //circular linked list created
  // print(nodeList[n-1].x);
  // print(nodeList[n-1].nextNode.x);

  int count = 1;
  Node currentNode = nodeList[0];
  Node previousNode;
  while (currentNode.nextNode !=
      currentNode) //stopping condition for only one node remaining
  {
    while (count < k) {
      previousNode = currentNode;
      currentNode = currentNode.nextNode;
      count++;
    }
    //remove kth node
    previousNode.nextNode = currentNode.nextNode;
    currentNode = previousNode.nextNode;
    count = 1;
    //kth node removed. count resetted to 1
  }
  return currentNode.x;
}

// Challenge 3
// Movie Theater Seating
// A group of n friends are going to see a movie. They would like to find a spot
// where they can sit next to each other in the same row. A movie theater's seat
// layout can be represented as a 2-D matrix, where 0s represent empty seats and
// 1s represent taken seats.

// Create a function that, given a seat layout and the number of friends n,
// returns the number of available spots for all n friends to sit together.
//
//Examples
int groupSeats(List<List<int>> list, int n) {
  //create frame
  // List<int> frame = List.filled(n, 0);
  // print(frame);
  bool frameMatch = true;
  int matchCount = 0;
  //match frame with every row
  for (int k = 0; k < list.length; k++) {
    int rowlength = list[k].length;
    for (int i = 0; i < rowlength - n + 1; i++) {
      //traverse through the list
      //match frame
      List<int> subList = list[k].sublist(i, i + n);
     // print(subList);
      if (matchFrame(subList)) {
        matchCount++;
      }
    }
  }

  return matchCount;
}
bool matchFrame(subList){
  int sum=0;
  for(int i=0;i<subList.length;i++)
    {
      sum=sum+subList[i];
    }
  if(sum==0){
    return true;
  }
  else{
    return false;
  }
}

main() {
  print(josephus(10, 3));
  print(groupSeats([
    [1, 0, 0, 1, 0, 1, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [0, 1, 1, 1, 1, 1, 1],
    [1, 0, 1, 1, 0, 0, 1],
    [1, 1, 1, 0, 1, 0, 1],
    [0, 1, 1, 1, 1, 1, 0],
  ], 2));
}
