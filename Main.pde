//Fabricio Vidal da Costa Junior
//Inicio: 14/09/2017
//Ultima Atualizacao: 19/09/2017
//Fim: ?

Jogador p1;
int numZombies = 10;
int balasRestantes = 2000;
int larguraJogo;
int alturaJogo;
int pontos = 0;
int fase = 1, proximaFase = 10, taxaZombies = round(fase/4)+1;
int zombiesMortos = 0;
IntList balasPerdidas = new IntList();
ArrayList<Zombie> horda = new ArrayList();
ArrayList<Projetil> balas = new ArrayList();

PImage p1_1Imagem, p1_2Imagem;
PImage bala1;
PImage mira1;

PImage zombie1_1Imagem, zombie1_2Imagem;
PImage zombie2_1Imagem, zombie2_2Imagem;
PImage zombie3_1Imagem, zombie3_2Imagem;
PImage zombie4_1Imagem, zombie4_2Imagem, zombie4_3Imagem;

void setup(){
  frameRate(60);
  size(500, 550, P2D);
  larguraJogo = width;
  alturaJogo = height - 50;
  
  preload();
  
  p1 = new Jogador();
  for(int i=0; i<numZombies; i++){
    horda.add(new Zombie());
  }
  
}