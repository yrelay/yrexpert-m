;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%INCODEF^INT^1^59547,73870^0
%INCODEF(LWH,VISU,WHDEF) 
 
 
 
 
 
 
 
 
 
 
 
 
 N LWHOIS,I,TEMP,ROU,WH,LCNX,ADR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S LCNX=$$CONCAS^%QZCHAD(TEMP,"CNX")
 S LWHOIS=$$CONCAS^%QZCHAD(TEMP,"LWHOIS")
 K @(TEMP)
 I WHDEF'="" S LWH(WHDEF)=""
 D ^%QCAGLTX("CNX^%INCODEF",LWHOIS)
 S WH=$O(@LWHOIS@(""))
 F I=0:0 Q:WH=""  D T1 S WH=$O(@LWHOIS@(WH))
 I WHDEF'="",$D(^INCONNE("CNY",WHDEF)) S ^INCONNE("DEFAUT","WHOIS")=WHDEF
 K @(TEMP)
 Q
T1 
 I '($D(@LWH@(WH))) Q
 D T11(LWHOIS,WH,VISU)
 Q
T11(LWHOIS,WH,VISU) 
 N ROU,I,TEMP,LCNX
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T11")
 S LCNX=$$CONCAS^%QZCHAD(TEMP,"LCNX")
 K @(TEMP)
 K @(LCNX)
 S ROU=$O(@LWHOIS@(WH,""))
 F I=0:0 Q:ROU=""  D T2 S ROU=$O(@LWHOIS@(WH,ROU))
 D T3
 K @(LCNX)
 K @(TEMP)
 W:VISU !,"initialisation des connexions de ",WH
 Q
T2 D ^%QCAGLTX(ROU,LCNX) Q
T3 N I,PREF,NF,ADR,CH
 S ADR=$$CONCAS^%QZCHAD("^INCONNE","CNX,"_WH)
 K @(ADR)
 S PREF=$O(@LCNX@(""))
 F I=0:1 Q:PREF=""  D T4 S PREF=$O(@LCNX@(PREF))
 D INT^%INCOSTO(WH,"^INCONNE(""CNX"")","^INCONNE(""CNY"")")
 Q
T4 S NF=I\7
 S CH=@LCNX@(PREF)
 S @ADR@(NF)=$$^%QCAZG($$CONCAS^%QZCHAD(ADR,NF))_PREF_"^"_$P(CH,"^",1)_"^"_$P(CH,"^",2)_"^"
 Q
 
 
 
 
 
 
 
 
 
 
DUPL(WHOR,WHODES) 
 N LWO,LWD
 Q:(WHOR="")!(WHODES="")
 Q:'($D(^INCONNE("CNX",WHOR)))
 S LWO=$S((WHOR+0)=WHOR:WHOR,1:""""_WHOR_"""")
 S LWD=$S((WHODES+0)=WHODES:WHODES,1:""""_WHODES_"""")
 D ADR^%QCAGLC("^INCONNE(""CNX"","_LWO,"^INCONNE(""CNX"","_LWD)
 D INT^%INCOSTO(WHODES,"^INCONNE(""CNX"")","^INCONNE(""CNY"")")
 Q
 
ALL N LWH,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"^ALL")
 S LWH=$$CONCAS^%QZCHAD(TEMP,"LWH")
 K @(TEMP)
 D ^%QCAGLTX("CNX^%INCODEF",LWH)
 D ^%INCODEF(LWH,1,"ALL")
 K @(TEMP)
 Q
STAND1(WH) 
 N LWHOIS,LWH1
 S LWHOIS="LWH1"
 S @LWHOIS@(WH,"STAND^%INCOX01")=""
 D T11(LWHOIS,WH,1)
 Q
STAND W !,"Quel utilisateur : " R WH
 I WH=0 Q
 D STAND1(WH)
 Q
 
 
 
CNX ;;|"ALL","ALL^%INCOX0"||         ;table complete des connexions
 ;;|"DMO","ALL^%INCOX1"||         ;DEMO 
 ;;|"DVT","ALL^%INCOX1"||         ;ET DEVELLOPEMENT
 ;;|"STAND","STAND^%INCOX01"||     ;utilisateur standart
 ;;|"ELC","ELC^%INCOX1"||         ;electronique
 ;;|"SMA","SMA^%INCOX4"||         ;snecma
 ;;|"BTL","ALL^%INCOX3"||         ;ISSOIRE
 ;;|"TLR","ALL^%INCOX3"||         
 ;;|"STL","ALL^%INCOX3"||         
 ;;|"ATF","ALL^%INCOX3"||         
 ;;|"BTS","ALL^%INCOX3"||         
 ;;|"CGD","ALL^%INCOX3"||         
 ;;|"FIL","ALL^%INCOX3"||         
 ;;|"DEMO","ALL^%INCOX3"||
 ;;|"CBL","CNX^%INCOX5"||         ;CEBAL
 ;;|"CBL1","CNX^%INCOX5"||
 ;;|"CBL2","CNX^%INCOX5"||
 ;;|"CBL3","CNX^%INCOX5"||
 ;;|"CBLX","CNX^%INCOX5"||
 ;;|"CEBAL","CNX1^%INCOX5"||
 ;;|"CBLD","CNX1^%INCOX5"||
 ;;|"CIAT","CNX^%INCOX6"||        ;CIAT
 ;;|"TAIC","CNX^%INCOX6"||         
 ;;|"TOCIAT","CNX^%INCOX6"||         
 ;;|"CLAL","CNX1^%INCOX8"||         ;CLAL
 ;;|"PTA","CNX1^%INCOX8"||
 ;;|"OLD","CNX1^%INCOX8"||
 ;;|"LAG","CNX1^%INCOX8"||
 ;;|"TAG","CNX1^%INCOX8"||
 ;;|"DMO","CNX1^%INCOX8"||
 ;;|"XCLAL","CNX1^%INCOX8"||         
 ;;|"JMS","CNX1^%INCOX7"||         ;JEUMONT SHNEIDER
 ;;|"GAN","GAN^%INCOX7"||
 ;;|"ESSAI.GAN","GAN^%INCOX7"||
 ;;|"GMT","GMT^%INCOX7"||
 ;;|"ESSAI.GMT","GMT^%INCOX7"||
 ;;|"MCA","CNX1^%INCOX2"||         ;MICHELIN
 ;;|"MCA","CNX1^%INCOX2"||         
 ;;|"INO","CNX2^%INCOX8"||         ;INOVAC
 ;;

