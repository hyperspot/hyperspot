<template>
  <div :class="classObj" class="layout">
    <lendHyoerspotHeader/>
    <router-view id="main" class="layout-content"/>
    <lendHyoerspotFooter/>
  </div>
</template>

<script>

import lendHyoerspotHeader from "@/components/lendHyoerspotHeader"
import lendHyoerspotFooter from "@/components/pageFooter";

export default {
  name: "layout",
  components: {

    lendHyoerspotHeader,
    lendHyoerspotFooter,

  },
  data() {
    return {
      showPrice: true,
      dialogVisible: false,
      isCollapse: true,
    }
  },
  watch: {
    isShowConnect() {
      this.dialogVisible = this.$store.state.app.isShowConnect
    }
  },
  computed: {
    isShowConnect() {
      return this.$store.state.app.isShowConnect
    },
    classObj() {
      return {
      }
    }
  },
  created() {
    if (this.$route.path == '/cityNodeToken' || this.$route.path == '/home') {
      this.showPrice = false
    } else {
      this.showPrice = true
    }
  },
  methods: {
    onClose() {
      this.$store.commit("app/SET_SHOWCONNECT")
    },
    async registerWeb3() {

    },
    async getWallet() {
      if (typeof window.ethereum == 'undefined') {
        this.$message.error("down metamask")
      }
      window.ethereum.request({method: 'eth_requestAccounts'});

      this.registerWeb3()

    },
  }
}
</script>

<style lang="scss">

.layout {
  overflow-x: hidden;
  width: 100%;
  height: 100%;
  background: url("./static/img/BG@2x.png");
  background-size: 100% 100%;
  display: flex;
  flex-direction: column;

  #main {
    position: relative;
    flex: 1;
    z-index: 1;
    width: 1100px;
    margin: 0px auto;
    padding: 30px 0;

    .no-data{
      text-align: center;
      padding: 10px 0;
    }
    .el-dialog__body{
      text-align: center;
      padding: 30px;
      line-height: 50px;
      .input-box{
        display: flex;
        flex-shrink: 0;
        .name{
          width: 80px;
        }
      }
    }
  }
  .title {
    font-size: 30px;
    font-weight: bold;
    display: flex;
    justify-content: space-between;

    .search-box {
      display: flex;
      align-items: center;
      width: 260px;
      height: 40px;
      background: rgba(255, 232, 215, 0.2);
      border-radius: 10px;
      border: 1px solid rgba(255, 82, 56, 0.5);
      padding: 0 10px;

      img {
        width: 20px;
        height: 20px;
      }

      input {
        font-size: 18px;
        border: none;
        flex: 1;
        background: rgba(255, 232, 215, 0);
        height: 100%;
        padding: 0 6px;
        &:focus-visible {
          outline: none;
        }
      }
    }
  }
}


</style>
