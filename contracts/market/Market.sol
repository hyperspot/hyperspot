pragma solidity ^0.8.0;
import '../interface/IERC20.sol';

contract Market {
    address usdc;
    address Dai;
    address eth;
    address cusdc;
    address cDai;
    address ceth;
    uint id;
    uint id2;
    
    struct usdcInfo{
        address usdc;
        uint APY;
        uint APY2;
        uint APY3;
        uint time;
        uint borrowingTime;
        // uint repaymentTime;
        uint mortgageRate;
        uint amount;
        uint uamount;
    }
    
    usdcInfo[] public usdcMarketList;
    usdcInfo[] public usdcList;
    usdcInfo[] public borrowUsdcList;
    mapping(address=>usdcInfo) userusdcInfo;
    
    struct DaiInfo{
        address Dai;
        uint APY;
        uint APY2;
        uint APY3;
        uint time;
        uint borrowingTime;
        uint mortgageRate;
        uint amount;
        uint uamount;
    }
    
    DaiInfo[]public DaiMarketList;
    DaiInfo[]public DaiList;
    DaiInfo[] public borrowDaiList;
    mapping(address=>DaiInfo) userDaiInfo;

     struct ethInfo{
        address eth;
        uint APY;
        uint APY2;
        uint APY3;
        uint time;
        uint borrowingTime;
        uint mortgageRate;
        uint amount;
        uint uamount;
    }
    ethInfo[]public ethMarketList;
    ethInfo[]public ethList;
    ethInfo[] public borrowEthList;
    mapping(address=>ethInfo) userethInfo;

    function init(address _usdc,address _Dai,address _eth) public {
        usdc=_usdc;
        Dai=_Dai;
        eth=_eth;
    }
    
    function setApy(address token,uint oneyear,uint twoyear,uint threeyear)public{
        //require(msg.sender==address(this),"No permission to modify");
        require(token==usdc||token==Dai||token==eth,"Please enter the correct token address");
        if(token==usdc){
                usdcInfo memory uinfo=usdcInfo({
                    usdc:token,
                    APY:oneyear,
                    APY2:twoyear,
                    APY3:threeyear,
                    time:0,
                    borrowingTime:0,
                    mortgageRate:120,
                    amount:0,
                    uamount:0
                });
            usdcMarketList.push(uinfo);
        }
        else if(token==Dai){
                DaiInfo memory uinfo=DaiInfo({
                    Dai:token,
                    APY:oneyear,
                    APY2:twoyear,
                    APY3:threeyear,
                    time:0,
                    borrowingTime:0,
                    mortgageRate:120,
                    amount:0,
                    uamount:0
                });
            DaiMarketList.push(uinfo);
        }

         else if(token==eth){
                ethInfo memory uinfo=ethInfo({
                    eth:token,
                    APY:oneyear,
                    APY2:twoyear,
                    APY3:threeyear,
                    time:0,
                    borrowingTime:0,
                    mortgageRate:150,
                    amount:0,
                    uamount:0
                });   
            ethMarketList.push(uinfo);
        }

    }
    
