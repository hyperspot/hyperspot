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
    
    function mortgageMarket(address token ,uint amounts,uint times)public{
        id2=id2+1;
        require(token==usdc||token==Dai||token==eth,"Please enter the correct token address");
        require(times==1||times==2||times==3,"Please choose the right time");
        if(token==usdc){
            if(times==1){
                usdcInfo memory uinfo=usdcInfo({
                    usdc :token,
                    APY:usdcMarketList[0].APY,
                    APY2:usdcMarketList[0].APY2,
                    APY3:usdcMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:120,
                    amount :amounts,
                    uamount:amounts+amounts*usdcMarketList[0].APY/100
                });
                usdcList.push(uinfo);
                IERC20(token).transferFrom(msg.sender,address(this),amounts);
                IERC20(cusdc).transferFrom(address(this),msg.sender,usdcList[id2-1].uamount);
            }
            else  if(times==2){
                usdcInfo memory uinfo=usdcInfo({
                    usdc :token,
                    APY:usdcMarketList[0].APY,
                    APY2:usdcMarketList[0].APY2,
                    APY3:usdcMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:120,
                    amount :amounts,
                    uamount:amounts+amounts*usdcMarketList[0].APY2/100
                });
                usdcList.push(uinfo);
                IERC20(token).transferFrom(msg.sender,address(this),amounts);
                IERC20(cusdc).transferFrom(address(this),msg.sender,usdcList[id2-1].uamount);
            }
            else  if(times==3){
                usdcInfo memory uinfo=usdcInfo({
                    usdc :token,
                    APY:usdcMarketList[0].APY,
                    APY2:usdcMarketList[0].APY2,
                    APY3:usdcMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:120,
                    amount :amounts,
                    uamount:amounts+amounts*usdcMarketList[0].APY3/100
                });
               usdcList.push(uinfo);
               IERC20(token).transferFrom(msg.sender,address(this),amounts);
               IERC20(cusdc).transferFrom(address(this),msg.sender,usdcList[id2-1].uamount);
            }
        }
        else if(token==Dai){
             if(times==1){
                  DaiInfo memory dinfo=DaiInfo({
                    Dai:token,
                    APY:DaiMarketList[0].APY,
                    APY2:DaiMarketList[0].APY2,
                    APY3:DaiMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:120,
                    amount:amounts,
                    uamount:amounts+amounts*DaiMarketList[0].APY/100
                });
                DaiList.push(dinfo);
                IERC20(token).transferFrom(msg.sender,address(this),amounts);
                IERC20(cDai).transferFrom(address(this),msg.sender,DaiList[id2-1].uamount);
             }
             else  if(times==2){
                  DaiInfo memory dinfo=DaiInfo({
                    Dai:token,
                    APY:DaiMarketList[0].APY,
                    APY2:DaiMarketList[0].APY2,
                    APY3:DaiMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:120,
                    amount:amounts,
                    uamount:amounts+amounts*DaiMarketList[0].APY2/100
                });
                DaiList.push(dinfo);
                IERC20(token).transferFrom(msg.sender,address(this),amounts);
                IERC20(cDai).transferFrom(address(this),msg.sender,DaiList[id2-1].uamount);
             }
             else  if(times==3){
                  DaiInfo memory dinfo=DaiInfo({
                    Dai:token,
                    APY:DaiMarketList[0].APY,
                    APY2:DaiMarketList[0].APY2,
                    APY3:DaiMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:120,
                    amount:amounts,
                    uamount:amounts+amounts*DaiMarketList[0].APY3/100
                });
                DaiList.push(dinfo);
                IERC20(token).transferFrom(msg.sender,address(this),amounts);
                IERC20(cDai).transferFrom(address(this),msg.sender,DaiList[id2-1].uamount);
             }
        }

          else if(token==eth){
              if(times==1){
                  ethInfo memory einfo=ethInfo({
                    eth:token,
                    APY:ethMarketList[0].APY,
                    APY2:ethMarketList[0].APY2,
                    APY3:ethMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:150,
                    amount:amounts,
                    uamount:amounts+amounts*ethMarketList[0].APY/100
                });  
                ethList.push(einfo);
                IERC20(token).transferFrom(msg.sender,address(this),amounts);
                IERC20(ceth).transferFrom(address(this),msg.sender,ethList[id2-1].uamount);
              }
              
             else if(times==2){
                  ethInfo memory einfo=ethInfo({
                    eth:token,
                    APY:ethMarketList[0].APY,
                    APY2:ethMarketList[0].APY2,
                    APY3:ethMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:150,
                    amount:amounts,
                    uamount:amounts+amounts*ethMarketList[0].APY2/100
                });  
                ethList.push(einfo);
                IERC20(token).transferFrom(msg.sender,address(this),amounts);
                IERC20(ceth).transferFrom(address(this),msg.sender,ethList[id2-1].uamount);
              }

               else if(times==3){
                  ethInfo memory einfo=ethInfo({
                    eth:token,
                    APY:ethMarketList[0].APY,
                    APY2:ethMarketList[0].APY2,
                    APY3:ethMarketList[0].APY3,
                    time:times,
                    borrowingTime:0,
                    mortgageRate:150,
                    amount:amounts,
                    uamount:amounts+amounts*ethMarketList[0].APY3/100
                });  
                ethList.push(einfo);
                IERC20(token).transferFrom(msg.sender,address(this),amounts);
                IERC20(ceth).transferFrom(address(this),msg.sender,ethList[id2-1].uamount);
              }
        }


    }
    function borrow(uint times ,address token ,uint amounts ,uint mortgageAmount)public{
        id=id+1;
        require(token==usdc||token==Dai||token==eth,"Please enter the correct token address");
        require(times==1||times==2||times==3,"Please choose the right time");
        uint32 blockTime = uint32(block.timestamp % 2 ** 32);
        if(token==usdc){
            require(mortgageAmount>=amounts*120/100,"Too little mortgage");
                usdcInfo memory uinfo=usdcInfo({
                    usdc :token,
                    APY:usdcMarketList[0].APY,
                    APY2:usdcMarketList[0].APY2,
                    APY3:usdcMarketList[0].APY3,
                    time:times,
                    borrowingTime:blockTime,
                    mortgageRate:120,
                    amount :amounts,
                    uamount:amounts+amounts*6/100
                });
                borrowUsdcList.push(uinfo);
            IERC20(token).transferFrom(address(this),msg.sender,amounts);
        }
        else if(token==Dai){
            require(mortgageAmount>=amounts*120/100,"Too little mortgage");
            DaiInfo memory Dinfo=DaiInfo({
                    Dai :token,
                     APY:DaiMarketList[0].APY,
                    APY2:DaiMarketList[0].APY2,
                    APY3:DaiMarketList[0].APY3,
                    time:times,
                    borrowingTime:blockTime,
                    mortgageRate:120,
                    amount :amounts,
                    uamount:amounts+amounts*6/100
                });
                borrowDaiList.push(Dinfo);
            IERC20(token).transferFrom(address(this),msg.sender,amounts);
            }   
         else if(token==eth){
            require(mortgageAmount>=amounts*150/100,"Too little mortgage");
            ethInfo memory einfo=ethInfo({
                    eth :token,
                    APY:ethMarketList[0].APY,
                    APY2:ethMarketList[0].APY2,
                    APY3:ethMarketList[0].APY3,
                    time:times,
                    borrowingTime:blockTime,
                    mortgageRate:120,
                    amount :amounts,
                    uamount:amounts+amounts*6/100
                });
                borrowEthList.push(einfo);
            IERC20(token).transferFrom(address(this),msg.sender,amounts);
        }  
    }

    function repayment(uint id,address token,uint amounts)public{
        uint32 blockTime = uint32(block.timestamp % 2 ** 32);
        if(token==usdc){
            require(borrowUsdcList[id-1].uamount==amounts,"Incorrect amount of repayment"); 
            IERC20(token).transferFrom(msg.sender,address(this),amounts);
        }
        else if(token==Dai){
            require(borrowDaiList[id-1].uamount==amounts,"Incorrect amount of repayment"); 
            IERC20(token).transferFrom(msg.sender,address(this),amounts);
        }
        else if(token==eth){
            require(borrowEthList[id-1].uamount==amounts,"Incorrect amount of repayment"); 
            IERC20(token).transferFrom(msg.sender,address(this),amounts);
        }
        
    }
    function conversion(address token,uint amounts)public {
        require(token==cusdc||token==cDai||token==ceth,"Exchange type error");
        require(IERC20(token).balanceOf(msg.sender)>=amounts,"The amount exchanged exceeds the balance");
        IERC20(token).transferFrom(address(this),msg.sender,amounts);
    }
    
    function usdcAPY(uint ids)public view returns(uint){
        return usdcList[ids].APY3;
    }
    
     function DaiAPY(uint ids)public view  returns(uint){
        return DaiList[ids].APY3;
    }
    
     function ethAPY(uint ids)public view returns(uint){
        return ethList[ids].APY3;
    }

}
