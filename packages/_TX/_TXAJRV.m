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

;%TXAJRV^INT^1^59547,74031^0
%TXAJRV ;
 
 
 
 
 N %I,RESUL,AFRESU,PATOUCH,DEJALU,ABENDSCR,CMS,ABAND,SCR,RVOUS,NOMTAB,TAB
 S CONNECT=0,DX=$X,DY=$Y
 D REV^%VVIDEO X XY W " "
 D NORM^%VVIDEO,HRV^%TXINDH
DEB S DX=0,DY=17 D CLEBAS^%VVIDEO,TITRE
 Q:ABAND=1
GNOM K RESUL,PATOUCH,AFRESU,DEJALU
 S (CTRLF,CMS,ABENDSCR)=0,SCR="IFRDV"
 ;; a traiter par ucont I RESUL(1)="RESERVE" D RESERVE Q
 ;; temporairement  fin de rdv pose a 15
 ;; 
 S HFRDV=10
 ;; grille necessitant que %POSTE,TAD,HRDV,HFRDV soient connus
 D ^%VAJOUT(SCR) Q:ABENDSCR=1
 D AJ^%TXGOCC
 S DX=PX,DY=PY D REV^%VVIDEO X XY W ^[QUI]OCCUPE(DP,DSEM,PY,PX)
 D NORM^%VVIDEO
 ;; ne pas cycler sur l'enreg des activites G DEB
 Q
 
TITRE 
 N POSX,LIMI,ZON,CONT
 S DX=5,DY=18 X XY W DAY,?$X+3,TAD,?$X+3,"a  " S POSX=$X+1
 W HRDV,"    ",^TABIDENT(WHOIS,"ENTETE")
 S DX=POSX+3,(ZON,LIMI)=$S($P(HRDV,"H",2)="":"00",1:$P(HRDV,"H",2)),LIMI=(LIMI\15)*15 X XY
MODIFH 
 D ^%TXCRZO Q:ABAND=1
 G:CONT=0 FIN
 S DX=DX-1,ZON=$S(ZON<LIMI:LIMI,ZON>(LIMI+14):LIMI+14,1:ZON) S:ZON<10 ZON="0"_ZON X XY W ZON S DX=DX+1 X XY G MODIFH
FIN 
 S DY=DY+2,DX=5,HRDV=$S(ZON="00":$E(HRDV,1,3),1:$E(HRDV,1,3)_ZON)
 Q
 
RESERVE 
 N DXR,DYR,FR,PX1,PY1,HRE1,MIN1,HRESF,RS,RR,DURES,POS
 S DXR=PX,DYR=PY,DY=17,DX=0 D CLEBAS^%VVIDEO
 S DX=5 X XY W $$^%QZCHW("Fin reservation(R),Abandon(CTRLA)")
 S DX=DXR,DY=DYR X XY
 S NXI=9,NXS=57,NYI=DYR-1,NYS=DYR+1,MPASX=2,MPASY=0
MOVCUR D ^%VZECUR G:(X1'=$A("R"))&(X1'=1) MOVCUR G @X1
1 Q
82 D RESF
 S FR=PX1 G:FR<DXR MOVCUR
 S LIBEL="",DURES=(FR-DXR)+1,POS=1,RESERVE=" RESERVE",RR=1
 F RS=1:1:DURES S LIBEL=LIBEL_$E(RESERVE,RR),RR=RR+1 I RR>$L(RESERVE) S RR=1
 S DX=DXR,DY=DYR D REV^%VVIDEO X XY W LIBEL D NORM^%VVIDEO
 S %RESERVE=1,PX=DXR,PY=DYR D AJ^%TXGOCC
 K %RESERVE S ^[QUI]RDV(TAD,HRDV,"RESERVE","-","-")=HRESF
 Q
RESF S PX1=$X,HRE1=((PX1-10)\8)+DP,MIN1=$S(((PX1-10)#8)=0:"",1:(((PX1-10)#8)\2)*15)
 S HRESF=HRE1_"H"_MIN1 Q

