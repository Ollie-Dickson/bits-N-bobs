

class Population {
  
  int cellWidth = 4;
  int columns, rows;
  
  Cell[][] board;
  
  
  Population () {
    columns = width/cellWidth;
    rows = height/cellWidth;
    board = new Cell[columns][rows];
    init();
  }
  
  void init() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j ++) {
        board[i][j] = new Cell(i*cellWidth, j*cellWidth, cellWidth);
      }
    }
  }
  
  void generate() {
    
    int hostsCount = 0;
    int consumersCount = 0;
   for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
     
     if (board[i][j].state == 1){
       hostsCount ++;
     } else if (board[i][j].state == 2){
       consumersCount ++;
     }
    }
   }
   hosts = hostsCount;
   consumers = consumersCount;
   
   for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
     
      
     // hosts reproduce
     if (board[x][y].state == 1) {
       
      for (int i = -1; i <=1; i++) {
       for (int j = -1; j <= 1; j++) {
         if((i == 0)&&(j == 0)) {
         } else {
           if (board[(x+i+columns)%columns][(y+j+rows)%rows].state == 0) {
            float r = random(1);
            if (r <= g) {
              board[(x+i+columns)%columns][(y+j+rows)%rows].state = 1;
            }
           }
         }
       }
      }
      
     }
     
     // consumers spread and die
     if (board[x][y].state == 2) {
       
       for (int i = -1; i <=1; i++) {
       for (int j = -1; j <= 1; j++) {
         if((i == 0)&&(j == 0)) {
         } else {
           if (board[(x+i+columns)%columns][(y+j+rows)%rows].state == 1) {
            float r = random(1);
            if (r <= T) {
              board[(x+i+columns)%columns][(y+j+rows)%rows].state = 2;
            }
           }
         }
       }
      }
      float r = random(1);
       if (r <= v) {
         board[x][y].state = 0;
       }
     }
      
      
    }
   }
  
  
  // Game of Life Logic
  //// Loop through every spot in our 2D array and check spots neighbors
  //  for (int x = 0; x < columns; x++) {
  //    for (int y = 0; y < rows; y++) {

  //      // Add up all the states in a 3x3 surrounding grid
  //      int neighbors = 0;
  //      for (int i = -1; i <= 1; i++) {
  //        for (int j = -1; j <= 1; j++) {
  //          neighbors += board[(x+i+columns)%columns][(y+j+rows)%rows].previous;
  //        }
  //      }

  //      // A little trick to subtract the current cell's state since
  //      // we added it in the above loop
  //      neighbors -= board[x][y].previous;

  //      // Rules of Life
  //      if      ((board[x][y].state == 1) && (neighbors <  2)) board[x][y].newState(0);           // Loneliness
  //      else if ((board[x][y].state == 1) && (neighbors >  3)) board[x][y].newState(0);           // Overpopulation
  //      else if ((board[x][y].state == 0) && (neighbors == 3)) board[x][y].newState(1);           // Reproduction
  //      // else do nothing!
  //    }
  //  }
  }
  
  void display() {
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        board[i][j].display();
      }
    }
  }
  
  
  void saveData() {
   TableRow row = table.addRow();
   row.setInt("hosts", hosts);
   row.setInt("consumers", consumers);
   row.setInt("timeStep", timeSteps);
   
   saveTable(table, "data/" + fileName + ".csv");
  }
  
  
  
}
