

/******************** class ********************/
class Character
{
  int mPosX;
  int mPosY;
  
  Character() {
    mPosX = 0;
    mPosY = 0;
  }
  
  Character(int x, int y) {
    mPosX = x;
    mPosY = y;
  }
  
  void setPosition(int x, int y) {
    mPosX = x;
    mPosY = y;
  }
};

class Baggage
{
  int mNum;
  int mPosX;
  int mPosY;
  
  Baggage() {
    mPosX = 0;
    mPosY = 0;
    mNum = 0;
  }
  
  Baggage(int x, int y, int num) {
    mPosX = x;
    mPosY = y;
    mNum = num;
  }
}

class BaggageManager
{
  int mTotalCount;
  ArrayList<Baggage> mALBaggage;
  
  BaggageManager() {
    mTotalCount = 0;
    mALBaggage = new ArrayList<Baggage>();
  }
  
  void add(int pBagPosX, int pBagPosY) {
    ++mTotalCount;
    mALBaggage.add(new Baggage(pBagPosX, pBagPosY, mTotalCount));
  }
  
  void reset() {
     for(int cnt = 0;cnt < mTotalCount;++cnt) {
       mALBaggage.remove(0);
     }
     
     mTotalCount = 0;
     mALBaggage = new ArrayList<Baggage>();
  }
};

class Step
{
  int mCharPosX;
  int mCharPosY;
  Baggage mBaggage;

  Step() {
      mCharPosX = 0;
      mCharPosY = 0;
      mBaggage = new Baggage();   
  }

  Step(int cPosX, int cPosY, int bPosX, int bPosY, int bNum) {
      mCharPosX = cPosX;
      mCharPosY = cPosY;
      mBaggage = new Baggage(bPosX, bPosY, bNum);
  }
};

class History
{
  int mLife;
  int mTotalCount;
  ArrayList<Step> mALStep;
  
  History() {
    mALStep = new ArrayList<Step>();
    mTotalCount = 0;
    mLife = 3;
  }

  void add(int cPosX, int cPosY, int bPosX, int bPosY, int bNum) {
    ++mTotalCount;
    mALStep.add(new Step(cPosX, cPosY, bPosX, bPosY, bNum));
  }

  void subLife() {
    --mLife;
  }

  int getLife() {
    return mLife;
  }

  Step get() {
    Step temp = new Step();
    
    println("check al size = ", mALStep.size());
    
    temp = mALStep.get(mTotalCount - 1);
    mALStep.remove(mTotalCount - 1);

    println("check al size = ", mALStep.size());

    --mTotalCount;
    
    return temp;
  }

  void reset() {
     for(int cnt = 0;cnt < mTotalCount;++cnt) {
       mALStep.remove(0);
     }
     
     mALStep = new ArrayList<Step>();
     mTotalCount = 0;
     mLife = 3;
  }
};

/**************** global *********************/
// 'w' = wall, don't move
// 'i' = idle space
// 'd' = destination
// 'b' = baggage
// 's' = start position
char map[][] = 
  { 
    // stage 1
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'b', 'i', 'b', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'd', 'i', 'b', 's', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'b', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'},

    // stage 2
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 's', 'b', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'b', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'b', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'd', 'b', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'd', 'd', 'c', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'},

    // stage 3
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'd', 's', 'b', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'b', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'd', 'w', 'w', 'b', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'w', 'i', 'd', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'b', 'i', 'c', 'b', 'b', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'i', 'd', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',},

    // stage 4
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'w', 'w', 'i', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'i', 'b', 'i', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'b', 'i', 'w', 'w', 'w', 'i', 'b', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'i', 'w', 'd', 'd', 'd', 'w', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'i', 'w', 'd', 'd', 'd', 'w', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'i', 'b', 'i', 'i', 'b', 's', 'i', 'b', 'i', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'i', 'i', 'i', 'i', 'i', 'w', 'i', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',},

    // stage 5
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'i', 'i', 'w', 's', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'i', 'i', 'b', 'b', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'w', 'w', 'i', 'b', 'd', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',},

    // stage 6
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'i', 's', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'i', 'd', 'i', 'c', 'i', 'd', 'i', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'i', 'b', 'd', 'b', 'c', 'b', 'd', 'b', 'i', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'i', 'i', 'w', 'w', 'i', 'w', 'w', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',},
  };

/*
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',
      'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',},
 */

boolean gIsInitMap = false;
boolean gIsIntro = false;

int gDelay;

int gStage = 0;
int gLastStage = 6;

PFont gStepFont;
PFont gTotalFont;

Character master = new Character();
BaggageManager bManager = new BaggageManager();
History gHistory = new History();

int gBlocksize = 64;

int gHorizontalCount = 20;
int gVectivalCount = 15;

int gHorizontal = gBlocksize * gHorizontalCount;
int gVectival = gBlocksize * gVectivalCount;

int gTotalScore = 0;

/********************* function ************************/
void setup()
{
  size(1280, 960);
  //size(640, 640);
  background(255);
  
  gStepFont = createFont("NanumSquareEB.ttf", 28);
  gTotalFont = createFont("NanumSquareEB.ttf", 45);
}

void draw()
{ 
  if(gDelay > 0) {
    delay(gDelay);
    gDelay = 0;
    clear();
  }
  
  if(!gIsInitMap && gIsIntro) {
    drawMap(gStage);
    drawCharacter();
  }

  if(!gIsIntro) {
    drawIntro();
    gDelay = 3000;
    gIsIntro = true;
  }

  if(gStage >= gLastStage) {
    exit(); 
  }
}

boolean checkComplete()
{
  int lCheckBaggage = 0;
  
  if(bManager.mTotalCount == 0) {
    return false; 
  }
  
  for(int cnt = 0;cnt < bManager.mALBaggage.size();++cnt) {
    Baggage b = bManager.mALBaggage.get(cnt);

    int index = (b.mPosX / gBlocksize) + ((b.mPosY / gBlocksize) * gHorizontalCount);
    
    if((map[gStage][index] == 'd') || (map[gStage][index] == 'c')) {
      ++lCheckBaggage;
    }
  }
  
  if(bManager.mTotalCount == lCheckBaggage) {
    return true;
  } else {
    return false;
  }
}

/**
 * @brief keyboard event process routine
 * @details process keyboard event.
 */
void keyPressed()
{
  // get master position
  int index = (master.mPosX / gBlocksize) + ((master.mPosY / gBlocksize) * gHorizontalCount);
  boolean baggageMove = false;
  Baggage temp = new Baggage();

  switch(key) {
    case 'r':
    case 'R':
      clear();
      gIsInitMap = false;
      bManager.reset();
      gHistory.reset();
      break;

    case 'u':
    case 'U':
      if(gHistory.getLife() < 1) {
        return ; 
      }
      
      if(gHistory.mTotalCount > 0) {
        Step tempStep = gHistory.get();
        // character position change
        rect(master.mPosX, master.mPosY, gBlocksize, gBlocksize);
        master.mPosX = tempStep.mCharPosX;
        master.mPosY = tempStep.mCharPosY;

        if(tempStep.mBaggage.mNum > 0) {
          // baggage position change
          for(int cnt = 0;cnt < bManager.mALBaggage.size();++cnt) {
            Baggage b = bManager.mALBaggage.get(cnt);
          
            if(b.mNum == tempStep.mBaggage.mNum) {
              rect(b.mPosX, b.mPosY, gBlocksize, gBlocksize);
              b.mPosX = tempStep.mBaggage.mPosX;
              b.mPosY = tempStep.mBaggage.mPosY;
            }   
          }
        }
        
        gHistory.subLife();
      }
      break;
      
      case 'n':
      case 'N':
        clear();
        ++gStage;
        gIsInitMap = false;
    
        gTotalScore += gHistory.mTotalCount;
    
        bManager.reset();
        gHistory.reset();
        break;
        
      case 'p':
      case 'P':
        clear();
        --gStage;
        gIsInitMap = false;
    
        gTotalScore += gHistory.mTotalCount;
    
        bManager.reset();
        gHistory.reset();
        break;
  }

  if(key == CODED) {
    switch(keyCode) {
      case LEFT:
        // check left side is a wall
        if(map[gStage][index - 1] == 'w') {
          return ;  // left side is a wall. don't move
        }

        // check baggage position
        for(int cnt = 0;cnt < bManager.mALBaggage.size();++cnt) {
          Baggage b = bManager.mALBaggage.get(cnt);  
          
          // check baggage left side is a wall        
          if((b.mPosY == master.mPosY) && (b.mPosX == (master.mPosX - gBlocksize))) {
            if(map[gStage][index - 2] == 'w') {
              return ;  // left side is baggage, baggage left side is wall. don't move
            } else {
              // check baggage left side is a baggage
              for(int scnt = 0;scnt < bManager.mALBaggage.size();++scnt) {
                Baggage sb = bManager.mALBaggage.get(scnt);
                if((sb.mPosY == master.mPosY) && (sb.mPosX == (master.mPosX - (gBlocksize * 2)))) {
                  return ;  // left side is baggage, baggage left side is baggage. don't move
                }
              }
              
              // move baggage on left
              rect(b.mPosX, b.mPosY, gBlocksize, gBlocksize);
              b.mPosX -= gBlocksize;
              baggageMove = true;
              temp = b;
            }
          }
        }

        // delete character
        stroke(255, 255, 255);
        rect(master.mPosX, master.mPosY, gBlocksize, gBlocksize);
        
        // move character on left
        master.mPosX -= gBlocksize;
        
        // write step history
        if(baggageMove) {
          gHistory.add(master.mPosX + gBlocksize, master.mPosY, temp.mPosX + gBlocksize, temp.mPosY, temp.mNum);
        } else {
          gHistory.add(master.mPosX + gBlocksize, master.mPosY, 0, 0, 0);
        }
        break;
      
      case RIGHT:
        if(map[gStage][index + 1] == 'w')
          return ;

        for(int cnt = 0;cnt < bManager.mALBaggage.size();++cnt) {
          Baggage b = bManager.mALBaggage.get(cnt);
          if((b.mPosY == master.mPosY) && (b.mPosX == (master.mPosX + gBlocksize))) {
            if(map[gStage][index + 2] == 'w') {
              return ;
            } else {
              for(int scnt = 0;scnt < bManager.mALBaggage.size();++scnt) {
                Baggage sb = bManager.mALBaggage.get(scnt);     
                if((sb.mPosY == master.mPosY) && (sb.mPosX == (master.mPosX + (gBlocksize * 2)))) {
                  return ; 
                }
              }
              rect(b.mPosX, b.mPosY, gBlocksize, gBlocksize);
              b.mPosX += gBlocksize;
              baggageMove = true;
              temp = b;
            }
          }
        }
        
        stroke(255, 255, 255);
        rect(master.mPosX, master.mPosY, gBlocksize, gBlocksize);
        master.mPosX += gBlocksize;
        
        if(baggageMove) {
          gHistory.add(master.mPosX - gBlocksize, master.mPosY, temp.mPosX - gBlocksize, temp.mPosY, temp.mNum);
        } else {
          gHistory.add(master.mPosX - gBlocksize, master.mPosY, 0, 0, 0);
        }
        break;
        
      case UP:
        if(map[gStage][index - gHorizontalCount] == 'w')
          break;

        for(int cnt = 0;cnt < bManager.mALBaggage.size();++cnt) {
          Baggage b = bManager.mALBaggage.get(cnt);
          if((b.mPosX == master.mPosX) && (b.mPosY == (master.mPosY - 64))) {
            if(map[gStage][index - (gHorizontalCount * 2)] == 'w') {
              return ;
            } else {
              for(int scnt = 0;scnt < bManager.mALBaggage.size();++scnt) {
                Baggage sb = bManager.mALBaggage.get(scnt);     
                if((sb.mPosX == master.mPosX) && (sb.mPosY == (master.mPosY - 128))) {
                  return ; 
                }
              }
              rect(b.mPosX, b.mPosY, gBlocksize, gBlocksize);
              b.mPosY -= gBlocksize;
              baggageMove = true;
              temp = b;
            } 
          }
        }

        stroke(255, 255, 255);
        rect(master.mPosX, master.mPosY, gBlocksize, gBlocksize);
        master.mPosY -= gBlocksize;

        if(baggageMove) {
          gHistory.add(master.mPosX, master.mPosY + gBlocksize, temp.mPosX, temp.mPosY + gBlocksize, temp.mNum);
        } else {
          gHistory.add(master.mPosX, master.mPosY + gBlocksize, 0, 0, 0);
        }
        break;
        
      case DOWN:
        if(map[gStage][index + gHorizontalCount] == 'w')
          break;

        for(int cnt = 0;cnt < bManager.mALBaggage.size();++cnt) {
          Baggage b = bManager.mALBaggage.get(cnt);
          if((b.mPosX == master.mPosX) && (b.mPosY == (master.mPosY + 64))) {
            if(map[gStage][index + (gHorizontalCount * 2)] == 'w') {
              return ;
            } else {
              for(int scnt = 0;scnt < bManager.mALBaggage.size();++scnt) {
                Baggage sb = bManager.mALBaggage.get(scnt);     
                if((sb.mPosX == master.mPosX) && (sb.mPosY == (master.mPosY + 128))) {
                  return ; 
                }
              }
              rect(b.mPosX, b.mPosY, gBlocksize, gBlocksize);
              b.mPosY += 64;
              baggageMove = true;
              temp = b;
            }
          }
        }        
        
        stroke(255, 255, 255);
        rect(master.mPosX, master.mPosY, gBlocksize, gBlocksize);
        master.mPosY += gBlocksize;
        if(baggageMove) {
          gHistory.add(master.mPosX, master.mPosY - gBlocksize, temp.mPosX, temp.mPosY - gBlocksize, temp.mNum);
        } else {
          gHistory.add(master.mPosX, master.mPosY - gBlocksize, 0, 0, 0);
        }
        break;
    }
  }
  
  drawMap(gStage);
  drawCharacter();
  
  if(checkComplete()) {
    //draw stage clear
    clear();
    //PImage lComplete = loadImage("stage_complete.png");
    //image(lComplete, 0, 0); 
    //delay(5000);
    
    ++gStage;
    gIsInitMap = false;
    
    gTotalScore += gHistory.mTotalCount;
    
    bManager.reset();
    gHistory.reset();
    
    if(gStage >= gLastStage) {
      drawResult(); 
    } else {
      drawComplete();
    }
  
    gDelay = 3000;
  }
}

void drawComplete()
{
  PImage lImgComplete = loadImage("stage_complete.png");
  image(lImgComplete, 0, 0); 
    
  String lStrTotal = "Total step = " + str(gTotalScore);
  textFont(gTotalFont);
  text(lStrTotal, 500, 700);
}

void drawResult()
{
  PImage lImgResult = loadImage("result.png");
  image(lImgResult, 0, 0); 
    
  String lStrTotal = "Total step = " + str(gTotalScore);
  textFont(gTotalFont);
  text(lStrTotal, 500, 700);
}

void drawIntro()
{
  PImage lImgIntro = loadImage("intro.png");
  image(lImgIntro, 0, 0); 
}

void clear()
{
  rect(0, 0, gHorizontal , gVectival ); 
}

/**
 * @brief character draw function
 * @details draw character (master, baggage...) 
 */
void drawCharacter()
{
  PImage lCharacter = loadImage("masterN.png");

  image(lCharacter, master.mPosX, master.mPosY);
  
  PImage lBaggage = loadImage("baggage.png");
  PImage lBaggageOnDst = loadImage("baggageOnDst.png");
  
  for(int cnt = 0;cnt < bManager.mALBaggage.size();++cnt) {
    Baggage b = bManager.mALBaggage.get(cnt);
    
    int index = (b.mPosX / gBlocksize) + ((b.mPosY / gBlocksize) * gHorizontalCount);
    
    if((map[gStage][index] == 'd') || (map[gStage][index] == 'c')) {
      image(lBaggageOnDst, b.mPosX, b.mPosY);
    } else { 
      image(lBaggage, b.mPosX, b.mPosY);
    }
  }
  
  PImage lHeartFull = loadImage("heartFull.png");
  PImage lHeartEmpty = loadImage("heartEmpty.png");
  
  int testx = 1190;
  
  for(int cnt = 3;cnt > 0;--cnt) {
    if(cnt - 1 < gHistory.getLife()) {
      image(lHeartFull, (testx - (cnt * 32)) + 20, 10);
    } else {
      image(lHeartEmpty, (testx - (cnt * 32)) + 20, 10);
    }
  }
  
  PImage lImgWall = loadImage("wall.png");
  image(lImgWall, gHorizontal - gBlocksize , 0);
  
  String step = str(gHistory.mTotalCount);
  textFont(gStepFont);
  text(step, testx + 30, 30);
}

void drawMap(int pMapNum)
{
  if(gStage >= gLastStage) {
    return ;  
  }
  
  PImage lImgWall = loadImage("wall.png");
  PImage lImgDst = loadImage("dst.png");  
  
  for(int y = 0;y < gVectivalCount;++y) {
    for(int x = 0;x < gHorizontalCount ;++x) {
      switch(map[pMapNum][(y * gHorizontalCount) + x]) {
        case 'w':  // draw wall
          if(!gIsInitMap) {
            image(lImgWall, x * gBlocksize , y * gBlocksize);
          }
          break;
          
        case 'd':  // draw baggage destination
          image(lImgDst, x * gBlocksize , y * gBlocksize );
          break;

        case 'c':
          if(!gIsInitMap) {
            bManager.add(x * gBlocksize , y * gBlocksize );
          }
          image(lImgDst, x * gBlocksize , y * gBlocksize );
          break;
        
        case 'b':  // set baggage in baggage manager
          if(!gIsInitMap) {
            bManager.add(x * gBlocksize , y * gBlocksize );
          }
          break;

        case 's':  // set character start posision
          if(!gIsInitMap) {
            master.setPosition(x * gBlocksize , y * gBlocksize );
          }
          break;
                
        default:
          break;
      }
    }
  }
  
  gIsInitMap = true;
}
