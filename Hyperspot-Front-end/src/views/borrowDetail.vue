<template>
  <div class="nft-detail">
    <div class="coin">
      <img src="../assets/img/DAI@2x.png" alt="">
      <strong>Borrow DAI</strong>
    </div>
    <div class="detail-content">
      <div class="left-box">
        <div class="title">
          Fixed APY
        </div>
        <div class="coin-table">
          <canvas id='chart' width="600" height="200" style="width: 600px!important;height: 200px!important"></canvas>
        </div>
        <div class="coin-info-box">
          <div class="left">
            <div class="title">
              Total at Maturity
            </div>
            <div class="value">
              2,000,800,900.00
            </div>
          </div>
          <div class="right">
            <div class="title">
              Total at Maturity
            </div>
            <div class="value">
              2,000,800,900.00
            </div>
          </div>
        </div>
        <div class="table-detail">
          <div class="title">
            Calculated Interest
          </div>
          <div class="table-header">
            <div class="item">
              Tenor
            </div>
            <div class="item">
              Maturity
            </div>
            <div class="item">
              APY
            </div>
            <div class="item">
              10k
            </div>
            <div class="item">
              100k
            </div>
            <div class="item">
              1M
            </div>
            <div class="item">
              10M
            </div>
          </div>
          <div class="row-box">
            <div class="col">
              3 Month
            </div>
            <div class="col">
              Jun 27 2022
            </div>
            <div class="col">
              5.357%
            </div>
            <div class="col">
              5.056%
            </div>
            <div class="col">
              5.048%
            </div>
            <div class="col">
              4.961%
            </div>
            <div class="col">
              4.133%
            </div>
          </div>
          <div class="row-box">
            <div class="col">
              3 Month
            </div>
            <div class="col">
              Jun 27 2022
            </div>
            <div class="col">
              5.357%
            </div>
            <div class="col">
              5.056%
            </div>
            <div class="col">
              5.048%
            </div>
            <div class="col">
              4.961%
            </div>
            <div class="col">
              4.133%
            </div>
          </div>
          <div class="row-box">
            <div class="col">
              3 Month
            </div>
            <div class="col">
              Jun 27 2022
            </div>
            <div class="col">
              5.357%
            </div>
            <div class="col">
              5.056%
            </div>
            <div class="col">
              5.048%
            </div>
            <div class="col">
              4.961%
            </div>
            <div class="col">
              4.133%
            </div>
          </div>
        </div>
      </div>
      <div class="right-box">
        <div class="title">
          Borrow Order
        </div>
        <div class="right-content">
          <div class="title">
            Select a maturity & fix your rate
          </div>
          <div class="info">
            You will receive your principal & fixed interest on the corresponding date.
          </div>
          <div class="rate-box">
            <div class="item">
              <div class="title">
                Jun 27 2022
              </div>
              <div class="value">
                5.357%
              </div>
            </div>
            <div class="item">
              <div class="title">
                Jun 27 2022
              </div>
              <div class="value">
                5.357%
              </div>
            </div>
            <div class="item">
              <div class="title">
                Jun 27 2022
              </div>
              <div class="value">
                5.357%
              </div>
            </div>
          </div>
          <div class="borrow-box">
            <div class="lend-info">
              How much do you want to borrow?
            </div>
            <div class="lend-input">
              <input type="text">
              <img class="icon" src="../assets/img/DAI@2x.png" alt="">
              <strong>ETH</strong>
              <img class="down" src="../assets/img/down.png" alt="">
            </div>
            <div class="widthdraw-tip">
              Withdraw to Wallet
            </div>
          </div>
          <div class="specify-box">
            <div class="title">
              Specify collateral to deposit
            </div>
            <div class="radio-box">
              <div class="left">
                Loan to value ratio
              </div>
              <div class="right">
                NO DEBT
              </div>
            </div>
            <div class="tip">
              Adjust your risk here, a lower ratio will reduce your risk of liquidation and increase the safety of your portfolio.
            </div>
            <div class="lend-input" style="margin-top: 20px">
              <input type="text">
              <img class="icon" src="../assets/img/DAI@2x.png" alt="">
              <strong>ETH</strong>
              <img class="down" src="../assets/img/down.png" alt="">
            </div>
            <div class="deposit-conllateral">
              Deposit Collateral
            </div>
          </div>
          <div class="operate" @click="trade">
            Trade
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: "detail",
  data(){
    return{
      chartData: [
          1,5,2,1
      ]
    }
  },
  computed:{
    account(){
      return this.$store.state.app.account
    }
  },
  mounted() {
    this.initChart()
  },
  methods:{
    trade(){
      console.log(this.account)
      this.$store.dispatch("market/allowance",{owner:this.account,spender:this.account})
      this.$store.dispatch("market/approve", {spender:this.account, amount:10})
    },
    initChart() {
      if(!document.getElementById('chart')){
        return
      }
      let canvas = document.getElementById('chart'),
          ctx = canvas.getContext('2d'),
          grad = ctx.createLinearGradient(0, 0, 0, window.innerHeight)

      // Create a background gradient.
      grad.addColorStop(0, 'rgba(71, 34, 96, .7)')
      grad.addColorStop(.9, 'rgba(44, 51, 233, .7)')
      grad.addColorStop(1, 'rgba(44, 51, 233, .7)')

      // Create a shadow line.
      // eslint-disable-next-line no-undef
      let shadowLine = Chart.controllers.line.extend({
        initialize: function () {
          // eslint-disable-next-line no-undef
          Chart.controllers.line.prototype.initialize.apply(this, arguments)

          var ctx = this.chart.ctx
          var originalStroke = ctx.stroke
          ctx.stroke = function () {
            ctx.save()
            ctx.shadowColor = '#1a1426'
            ctx.shadowOffsetY = 5
            ctx.shadowBlur = 15
            originalStroke.apply(this, arguments)
            ctx.restore()
          }
        }
      })
      // eslint-disable-next-line no-undef
      Chart.controllers.shadowLine = shadowLine
      let labels= [], dummyData = this.chartData;
      dummyData.forEach(number=>{
        labels.push('')

      })
      // eslint-disable-next-line no-undef
      let chart = new Chart(ctx, {
        type: 'shadowLine',
        data: {
          labels: labels,
          datasets: [{
            label: '',
            backgroundColor: grad,
            borderColor: 'rgb(193, 130, 255)',
            bezierCurve: true,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderColor: 'rgba(255, 255, 255, 1)',
            pointRadius: 7,
            pointHoverRadius: 7,
            data: dummyData,
          }]
        },
        options: {
          title: {
            display: false
          },
          layout: {
            padding: {
              left: 50
            }
          },
          legend: {
            labels: {
              boxWidth: 0,
              fontColor: 'rgba(255, 255, 255)',
              fontSize: 16,
              padding: 16
            },
          },
          scales: {
            xAxes: [{
              type: 'category',
              gridLines: {
                color: 'rgba(64, 71, 91, 1)',
                borderDash: [5, 2]
              },
              ticks: {
                padding: 0
              }
            }],
            yAxes: [{
              gridLines: {
                color: 'rgba(64, 71, 91, 1)',
                borderDash: [5, 2]
              },
              ticks: {
                min: Math.min.apply(null,dummyData),
                suggestedMax: Math.max.apply(null, dummyData) / 10,
                // Include a dollar sign in the ticks
                callback: function (value, index, values) {
                  return value + '     '
                }
              }
            }]
          },
          // Code mostly copied from http://www.chartjs.org/docs/latest/configuration/tooltip.html#external-custom-tooltips
          tooltips: {
            custom: function (tooltipModel) {
              let tooltipEl = document.getElementById('chartjs-tooltip')
              let tooltipElText = tooltipEl.querySelector('#chartjs-tooltip__text')

              // Hide if no tooltip
              if (tooltipModel.opacity === 0) {
                // tooltipEl.style.opacity = 0
                return
              }

              // Set caret Position
              tooltipEl.classList.remove('above', 'below', 'no-transform', 'active')
              if (tooltipModel.yAlign) {
                tooltipEl.classList.add(tooltipModel.yAlign)
              } else {
                tooltipEl.classList.add('no-transform')
              }

              function getBody(bodyItem) {
                return bodyItem.lines
              }

              if (tooltipModel.body) {
                let titleLines = tooltipModel.title || []
                let bodyLines = tooltipModel.body.map(getBody)

                // `this` will be the overall tooltip
                var position = this._chart.canvas.getBoundingClientRect()

                // Display, position, and set styles for font
                tooltipEl.className += ' active'
                tooltipEl.style.top = tooltipModel.caretY - 34 + 'px'
                tooltipEl.style.height = position.height - tooltipModel.caretY  + 'px'
                tooltipElText.style.width = tooltipModel.width + 'px'
                tooltipEl.style.left = position.left + tooltipModel.caretX + 'px'

                // Hide original tooltip
                tooltipModel.opacity = 0

                // Set text
                tooltipElText.innerHTML = ''

                for (let i = 0; i < bodyLines.length; i++) {
                  var body = bodyLines[i]
                  tooltipElText.innerHTML += body
                }
              }
            }
          }
        }
      })
    },
  }
}
</script>

<style lang="scss" scoped>
.nft-detail {
  width: 1100px!important;
  margin: 0 auto;
  .coin {
    display: flex;
    align-items: center;
    margin: 10px 0;
    font-size: 30px;
    img {
      width: 42px;
      margin-right: 6px;
    }

  }
  .detail-content{
    padding-top: 30px;
    display: flex;
    justify-content: space-between;
    .left-box{
      .coin-table {
        margin-top: 20px;
        width: 660px;
        height: 226px;
        background: #07121C;
        border-radius: 10px;
        border: 1px solid #333333;
      }
      .coin-info-box{
        margin-top: 30px;
        display: flex;
        justify-content: space-between;
        >div{
          padding:20px;
          width: 320px;
          height: 100px;
          background: #07121C;
          border-radius: 10px;
          border: 1px solid #333333;
          .title{
            font-size: 14px;
            font-weight: bold;
            color: #666;
            line-height: 22px;
          }
          .value{
            font-size: 30px;
            font-family: Roboto-Bold, Roboto;
            font-weight: bold;
            color: #FFFFFF;
            line-height: 35px;
          }
        }
      }
      .table-detail{
        margin-top: 20px;
        width: 660px;
        height: 250px;
        background: #07121C;
        border-radius: 10px;
        border: 1px solid #333333;
        .title{
          padding:20px;
          font-size: 20px;
        }
        .table-header{
          display: flex;
          border-bottom: 1px solid #666666;
          padding: 10px 20px 20px;
          margin-bottom: 10px;
          color: #666;
          justify-content: space-between;
        }
        .row-box  {
          padding: 10px 20px;
          display: flex;
          justify-content: space-between;
        }
      }
    }
    .right-box{
      .right-content{
        margin-top: 30px;
        width: 400px;
        background: #07121C;
        border-radius: 10px;
        border: 1px solid #333333;
        padding: 20px;
        .title{
          font-size: 20px;
          line-height: 36px;
        }
        .info{
          color: #666;
          padding: 20px 0;
          font-size: 16px;
        }
        .rate-box{
          display: flex;
          justify-content: space-between;
          >div{
            width: 110px;
            height: 80px;
            border-radius: 20px;
            padding: 16px 8px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.25);
            &:hover{
              background: linear-gradient(90deg, rgba(#07E0DD, 0.1) 0%, rgba(#625DFF,0.2) 100%);

              border: 2px solid;
              border-image: linear-gradient(90deg, rgba(97, 93, 255, 1), rgba(7, 217, 215, 1)) 2 2;
            }
            .title{
              color: #A6A6A6;
              font-size: 14px;
              line-height: 26px;
            }
            .value{
              text-align: center;
              font-size: 14px;
            }
          }
        }
        .borrow-box{
          margin-top: 20px;
          border-top: 1px solid #333;
          border-bottom: 1px solid #333;
          .widthdraw-tip{
            margin: 10px 0;
          }
        }
        .specify-box{
          .radio-box{
            display: flex;
            justify-content: space-between;
            padding: 10px 0 20px;
          }
          .deposit-conllateral{
            padding: 20px 0;
          }
        }
        .lend-info{
          font-size: 20px;
          font-weight: bold;
          color: #FFFFFF;
          margin: 30px 0 10px;
          line-height: 36px;
        }
        .lend-input{
          display: flex;
          align-items: center;
          width: 330px;
          height: 60px;
          padding: 10px;
          background: rgba(255, 255, 255, 0.05);
          box-shadow: 0px 5px 10px 1px rgba(0, 0, 0, 0.01);
          border-radius: 35px;
          border: 1px solid #333333;
          input{
            width: 210px;
            height: 40px;
            border-radius: 20px;
            background: #07121C;
            border: none;
            color: #fff;
            padding: 0 10px;
            font-size: 16px;
            &:focus-visible {
              outline: none;
            }
          }
          .icon{
            width: 22px;
            height: 22px;
            margin: 0 10px 0 6px;
          }
          .down{
            width: 16px;
            height: 16px;
            margin: 0 6px;
          }
        }
        .operate{
          line-height: 50px;
          width: 330px;
          text-align: center;
          font-size: 18px;
          cursor: pointer;
          height: 50px;
          background: linear-gradient(90deg, #07E0DD 0%, #625DFF 100%);
          border-radius: 30px;
        }
      }
    }
  }

}
</style>
