int screen=0, time=0, score=0, combo=0, difficulty=0, HP=1000, setuptime=0, 
  f=0, g=0, h=0, j=0, 
  vf=0, vg=0, vh=0, vj=0, 
  yf=0, yg=0, yh=0, yj=0;

void setup() {
  size(1100, 1000);
  textAlign(CENTER, CENTER);
  vf=(int)random(5, 10);
  vg=(int)random(5, 10);
  vh=(int)random(5, 10);
  vj=(int)random(5, 10);
}

void draw() {
  ballSpeed();
  graphics();
  PointJudge();
}

void keyPressed() {
  ChooseDifficulty();
  Fjudge();
  Gjudge();
  Hjudge();
  Jjudge();
}

void graphics() {
  if (screen==0) {
    setuptime=millis()/1000;
    fill(0);
    rect(0, 0, width, height);
    textSize(100);
    if (difficulty>=3) {
      fill(255, 5, 5);
    }
    if (difficulty<=2&&difficulty>=-2) {
      fill(5, 255, 5);
    }
    if (difficulty<=-3) {
      fill(5, 5, 255);
    }
    text("TIMING GAME", 550, 350);
    textSize(50);
    text("DIFFICULTY:", 500, 550);
    text(difficulty, 700, 550);
  }
  if (screen==1) {
    loop();
    time=millis()/1000;
    background(255);
    noStroke();
    fill(0);
    rect(800, 0, width, height);
    stroke(0);
    line(800, 0, 800, height);
    line(200, 0, 200, height);
    line(400, 0, 400, height);
    line(600, 0, 600, height);
    line(0, 800, 800, 800 );
    fill(255);
    textSize(50);
    text("SCORE", 950, 50);
    text("COMBO", 950, 300);
    text("TIME", 950, 550);
    text("HP:", 900, 800);
    text(score, 950, 150);
    text(combo, 950, 400); 
    text(time-setuptime, 950, 650);
    text(HP, 1000, 800);
    fill(0);  
    if (f==0) {
      ellipse(100, yf, 100, 100);
    }
    if (g==0) {
      ellipse(300, yg, 100, 100);
    }
    if (h==0) {
      ellipse(500, yh, 100, 100);
    }
    if (j==0) {
      ellipse(700, yj, 100, 100);
    }
  }
  if (screen==2) {
    background(0);
    fill(255);
    textSize(100);
    text("GAME CLEAR", 550, 300);
    textSize(50);
    text("CLEAR TIME:", 500, 500);
    text(time, 700, 500);
    noLoop();
  }
  if (screen==3) {
    fill(0);
    rect(0, 0, width, height);
    textSize(100);
    fill(255, 5, 5);
    text("GAME OVER", 550, 300);
  }
}

void PointJudge() {
  if (score>=2000) {
    screen=2;
  }
  if (HP==0) {
    screen=3;
  }
}

void ballSpeed() {
  if (screen==1) {
    yf=yf+vf;
    yg=yg+vg;
    yh=yh+vh;
    yj=yj+vj; 

    if (yf>1000) {
      vf=(int)random(5, 10);
      yf=0;
      if (f==0) {
        combo=0;
        HP-=100;
      }
      f=0;
    }

    if (yg>1000) {
      vg=(int)random(5, 10);
      yg=0;
      if (g==0) {
        combo=0;
        HP-=100;
      }
      g=0;
    }

    if (yh>1000) {
      vh=(int)random(5, 10);
      yh=0;
      if (h==0) {
        combo=0;
        HP-=100;
      }
      h=0;
    }

    if (yj>1000) {
      vj=(int)random(5, 10);
      yj=0;
      if (j==0) {
        combo=0;
        HP-=100;
      }
      j=0;
    }
  }
}

boolean isPerfect(int P) {
  return (P>750+difficulty*5)&&(P<850-difficulty*5);
}

boolean isGreat(int G) {
  return (G>650+difficulty*5&&G<950-difficulty*5)&&(!isPerfect(G));
}

boolean isMiss(int M) {
  return(M>600&&M<1000)&&(!isGreat(M))&&(!isPerfect(M));
}

boolean isJudge(int J) {
  return (J>600)&&(J<1000);
}

void Fjudge() {
  if (key!='f'||f==1) {
    return;
  }
  if (isPerfect(yf)) {
    score+=100;
    combo++;
  }
  if  (isGreat(yf)) {
    score+=50;
    combo++;
  }
  if (isMiss(yf)) {
    HP-=100;
  }
  if (isJudge(yf)) {
    f=1;
  }
}

void Gjudge() {
  if (key!='g'||g==1) {
    return;
  }
  if (isPerfect(yg)) {
    score+=100;
    combo++;
  } 
  if  (isGreat(yg)) {
    score+=50;
    combo++;
  }
  if (isMiss(yg)) {
    HP-=100;
  }
  if (isJudge(yg)) {
    g=1;
  }
}

void Hjudge() {
  if (key!='h'||h==1) {
    return;
  }
  if (isPerfect(yh)) {
    score+=100;
    combo++;
  } 
  if  (isGreat(yh)) {
    score+=50;
    combo++;
  }
  if (isMiss(yh)) {
    HP-=100;
  }
  if (isJudge(yh)) {
    h=1;
  }
}

void Jjudge() {
  if (key!='j'||j==1) {
    return;
  }
  if (isPerfect(yj)) {
    score+=100;
    combo++;
  } 
  if  (isGreat(yj)) {
    score+=50;
    combo++;
  }
  if (isMiss(yj)) {
    HP-=100;
  }
  if (isJudge(yj)) {
    j=1;
  }
}

void ChooseDifficulty() {
  if (screen!=0) {
    return;
  }
  if (keyCode==UP) {
    difficulty+=1;
    if (difficulty>=5) {
      difficulty=5;
    }
  }
  if (keyCode==DOWN) {
    difficulty-=1;
    if (difficulty<=-5) {
      difficulty=-5;
    }
  }
  if (keyCode==ENTER) {
    screen=1;
  }
}
