<template>
  <div class="bank-list">
    <div class="title">
      Borrow Crypto at Fix
    </div>
    <div class="intro">
      Borrow against your crypto with certainty for up to one year. Lock in what you
      pay until maturity or exit early without penalty at the market rate.
    </div>

    <div class="list-box">
      <div class="list-item-box">
        <div class="list-item">
          <img src="../assets/img/DAI@2x.png" alt="">
          <div class="item-info">
            <div class="name">DAI</div>
            <div class="info">7.40% Fixed APY</div>
            <div class="operate" @click="$router.push('/borrowDetail')">
              Borrow
            </div>
          </div>
        </div>
      </div>
      <div class="list-item-box">
        <div class="list-item">
          <img src="../assets/img/DAI@2x.png" alt="">
          <div class="item-info">
            <div class="name">DAI</div>
            <div class="info">7.40% Fixed APY</div>
            <div class="operate" @click="$router.push('/borrowDetail')">
              Borrow
            </div>
          </div>
        </div>
      </div>
      <div class="list-item-box">
        <div class="list-item">
          <img src="../assets/img/DAI@2x.png" alt="">
          <div class="item-info">
            <div class="name">DAI</div>
            <div class="info">7.40% Fixed APY</div>
            <div class="operate" @click="$router.push('/borrowDetail')">
              Borrow
            </div>
          </div>
        </div>
      </div>
      <div class="list-item-box">
        <div class="list-item">
          <img src="../assets/img/DAI@2x.png" alt="">
          <div class="item-info">
            <div class="name">DAI</div>
            <div class="info">7.40% Fixed APY</div>
            <div class="operate" @click="$router.push('/borrowDetail')">
              Borrow
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "list",
  data(){
    return{
      activeIndex:0
    }
  }
}
</script>

<style lang="scss" scoped>
.bank-list {
  .title {
    font-size: 30px;
    font-weight: bold;
    display: flex;
    justify-content: space-between;
  }
  .intro{
    margin-top: 20px;
    width: 574px;
    font-size: 16px;
    font-weight: bold;
    color: #A6A6A6;
    line-height: 26px;
  }
  .nav-box{
    display: flex;
    margin: 30px 0;
    width: 240px;
    height: 40px;
    background: #07121C;
    border-radius: 30px;
    border: 1px solid #333333;
    .nav-item{
      cursor: pointer;
      text-align: center;
      width: 50%;
      height: 40px;
      line-height: 40px;
      border-radius: 30px;
      &.active{
        background: linear-gradient(90deg, #07E0DD 0%, #625DFF 100%);

      }
    }
  }
  .list-box{
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    .list-item-box{
      margin-top: 50px;
      border-radius: 10px;
      overflow: hidden;
      padding: 1px;
      &:hover{
        background: linear-gradient(135deg, rgba(7, 217, 215, 1), rgba(97, 93, 255, 1)) ;
        box-shadow: 0px 0px 20px 0px rgba(58, 149, 240, 0.5);
      }
    }
    .list-item{
      width: 535px;
      height: 240px;
      background: #07121C;

      border-radius: 10px;
      opacity: 0.95;
      display: flex;
      align-items: center;

      img{
        width: 60px;
        height: 60px;
        margin: 0 30px;
      }
      .item-info{
        line-height: 40px;
        div{
          margin: 10px 0;
        }
        .name{
          font-size: 20px;
          font-weight: bold;
          color: #F9AF1C;
          line-height: 24px;
        }
        .info{
          height: 35px;
          font-size: 30px;
          font-weight: bold;
          color: #FFFFFF;
          line-height: 35px;
        }
        .operate{
          width: 140px;
          height: 40px;
          background: linear-gradient(90deg, #07E0DD 0%, #625DFF 100%);
          border-radius: 30px;
          text-align: center;
          cursor: pointer;
        }
      }
    }
  }
}
</style>
