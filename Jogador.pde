class Jogador extends Entidade{
  
//Atributos
  boolean[] wasd = {false, false, false, false};
  float velocidadeX, velocidadeY, velocidadeMax, velocidadeMin, aceleracao, desaceleracao;
  int frame;
  
  
//Construtor
  public Jogador(){
    this.largura = 24;
    this.altura = 32;
    this.aceleracao = 0.4;
    this.desaceleracao = 0.2;
    this.velocidadeX = 0;
    this.velocidadeY = 0;
    this.velocidadeMax = 2;
    this.velocidadeMin = 0.2;
    this.forcaEmpurrao = 10;
    this.imagem = p1_1Imagem;
    this.frame = 1;
    this.vidas = 10;
  }
  
//Metodos
  void movimentar(){
    //Eixo X Checar
    if(this.wasd[1] == true){
      this.moverEsquerda();
    }
    else if(this.wasd[3] == true){
      this.moverDireita();
    }
    //Eixo Y Checar
    if(this.wasd[0] == true){
      this.moverCima();
    }
    else if(this.wasd[2] == true){
      this.moverBaixo();
    }
    
    this.desaceleracaoX();
    this.desaceleracaoY();
    this.checarPosicao();
  }

  //Eixo X Mover
  void moverEsquerda(){
    if(this.x > 0 && collideEsquerda == false){
      if(this.velocidadeX > -this.velocidadeMax){
        this.velocidadeX -= this.aceleracao;
        if(this.velocidadeX > 0){
          this.velocidadeX -= this.aceleracao;
        }
      }
      this.x += this.velocidadeX;
    }
  }
  
  void moverDireita(){
    if(this.x < larguraJogo-this.largura && collideDireita == false){
      if(this.velocidadeX < this.velocidadeMax){
        this.velocidadeX += this.aceleracao;
        if(this.velocidadeX < 0){
          this.velocidadeX += this.aceleracao;
        }
      }
      this.x += this.velocidadeX;
    }
  }
  
  //Eixo Y Mover
  void moverCima(){
    if(this.y > 0 && collideCima == false){
      if(this.velocidadeY > -this.velocidadeMax){
        this.velocidadeY -= this.aceleracao;
        if(this.velocidadeY > 0){
          this.velocidadeY -= this.aceleracao;
        }
      }
      this.y += this.velocidadeY;
    }
  }
  
  void moverBaixo(){
    if(this.y < alturaJogo-this.altura && collideBaixo == false){
      if(this.velocidadeY < this.velocidadeMax){
        this.velocidadeY += this.aceleracao;
        if(this.velocidadeY < 0){
          this.velocidadeY += this.aceleracao;
        }
      }
      this.y += this.velocidadeY;
    }
  }
  
  //Desaceleracao Eixo X
  void desaceleracaoX(){
    if(this.x > 0 && this.x < larguraJogo-this.largura && collideEsquerda == false && collideDireita == false){
      if(this.wasd[1] == false && this.wasd[3] == false){
        if(this.velocidadeX < -this.velocidadeMin || this.velocidadeX > this.velocidadeMin){
          if(this.velocidadeX > 0){
            this.velocidadeX -= this.desaceleracao; 
          }
          else if(this.velocidadeX < 0){
            this.velocidadeX += this.desaceleracao; 
          }
          this.x += this.velocidadeX;
        }
        else{
          this.velocidadeX = 0;
        }
      }
    }
    else{
      this.velocidadeX = 0;
    }
  }
  
  //Desaceleracao Eixo Y
  void desaceleracaoY(){
    if(this.y > 0 && this.y < alturaJogo-this.altura && collideCima == false && collideBaixo == false){
      if(this.wasd[0] == false && this.wasd[2] == false){
        if(this.velocidadeY < -this.velocidadeMin || this.velocidadeY > this.velocidadeMin){
          if(this.velocidadeY > 0){
            this.velocidadeY -= this.desaceleracao; 
          }
          else if(this.velocidadeY < 0){
            this.velocidadeY += this.desaceleracao; 
          }
          this.y += this.velocidadeY;
        }
        else{
          this.velocidadeY = 0;
        }
      }
    }
    else{
      this.velocidadeY = 0;
    }
  }
  
  //Ativadores de Direcao
  //Eixo X Ativador
  void esquerda(boolean pressionando){
    this.wasd[1] = pressionando;
  }
  
  void direita(boolean pressionando){
    this.wasd[3] = pressionando;
  }
  
  //Eixo Y Ativador
  void cima(boolean pressionando){
    this.wasd[0] = pressionando;
  }
  
  void baixo(boolean pressionando){
    this.wasd[2] = pressionando;
  }
  
  void checarPosicao(){
    //Eixo X
    if(this.x < 0 || this.collideEsquerda == true){
      this.x += 1;
    }
    else if(this.x > larguraJogo-this.largura || this.collideDireita == true){
      this.x -= 1;
    }
    
    //Eixo Y
    if(this.y < 0 || this.collideCima == true){
      this.y += 1;
    }
    else if(this.y > alturaJogo-this.altura || this.collideBaixo == true){
      this.y -= 1;
    }
    
    //Collide Side
    //Eixo X
    //if(this.collideEsquerda == true){
    //  this.x += this.velocidadeX;
    //}
    //else if(this.collideDireita == true){
    //  this.x -= this.velocidadeX;
    //}
    
    ////Eixo Y
    //if(this.collideCima == true){
    //  this.y += this.velocidadeY;
    //}
    //else if(this.collideBaixo == true){
    //  this.y -= this.velocidadeY;
    //}
    
  }
  
  void animar(){
    int taxaFrames = 9;
    if(frameCount % taxaFrames == 0){
      this.frame++;
      if(this.frame > 2){
        this.frame = 1;
      }
    }
    
    if(this.frame == 1){
      this.imagem = p1_1Imagem;
    }
    else{
      this.imagem = p1_2Imagem;
    }
    
  }
  
  void rodar(){
    
    if(this.velocidadeX != 0 || this.velocidadeY != 0){
      this.animar();
    }
    
    this.movimentar();
    this.desenhar();
  
  }
  
  void serEmpurrado(Entidade outro, float forca){
    this.levandoDano = true;
    String side;
    if(this.x > 0 && this.x < larguraJogo && this.y > 0 && this.y < alturaJogo){
      
      side = collideSide(this, outro);
      if(side == "direita"){
        this.x -= forca;
      }
      else if(side == "esquerda"){
        this.x += forca;
      }
      else if(side == "baixo"){
        this.y -= forca;
      }
      else if(side == "cima"){
        this.y += forca;
      }
      
    }
    
  }

}