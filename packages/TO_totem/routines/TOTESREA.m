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

;TOTESREA^INT^1^59547,74876^0
TOTESREA ;
 
FIN1 S VOK=0 G:'($D(^DON($I,PAR))) FIN2 S ORD=^DON($I,PAR),CHP=^[QUI]EXPLICI(USI,ORD,PAR),VPD=$P(CHP,"^",18) I C="" S VOK=1,C=VPD,DX=43,DY=PY X XY W C G END
 S VPA=C,PARA=PAR G EXPR
FIN11 S AYAYA=YA,YA=USI D ^TOTVLEG S YA=AYAYA K AYAYA I VOK=0 D EFF S ^VALPAR($I,PAR)="",DX=42,DY=OODY X XY G END
 S DX=0,DY=22 X XY D CLEBAS^%VVIDEO
FIN2 G END
 Q
EFF S DX=42,DY=PY X XY W "                            " X XY Q
EXPLIC I '($D(^DON($I,PAR))) G IMP
 S ORD=^DON($I,PAR),EV=^[QUI]EXPLICI(USI,ORD,PAR),PH=$S(PY>14:8,1:14),DE=PH,FI=DE+7 D ^%ABNETTO S DXG=0,DXD=79,DYH=PH,DYB=PH+7,GRAPH=0,MSG="" D TO4^%VZCD
 S DX=2,DY=PH+1,PHB=PH+7 X XY W ^POSFUL($I,PAGE,PY) S DY=DY+1 D GETPLAG^TOMEMOIR S DE=PH,FI=DE+7 F DDY=DE:1:FI D ECR
 D EFF S DX=43 X XY K EV,ORD,PH,DE,FI,DDY Q
IMP D POCLEPA^%VVIDEO W ^POSFUL($I,PAGE,PY)," [RETURN] " R *RET D POCLEPA^%VVIDEO,EFF S DX=43,DY=PY Q
ECR Q:'($D(^POSENR($I,PAGE,DY)))
 S DY=DDY,DX=0 X XY S PAR=$P(^POSENR($I,PAGE,DY),"^",1) W $E(PAR,1,37) S DX=40 X XY W " = ",^VALPAR($I,PAR) Q
END K DE,FI,CHP,ADY,PARA,VPA,VPD Q
EXPR S VOK=1 F IT="+","-","*","/","\","_","#",")","(","'" G:C[IT END
 G:$D(^[QUI]FULL(YA,C)) END S PCH=C,%OOCC=C K PCHCOMP D ^%LXABR S C=%OOCC K %OOCC,PCH I $D(PCHCOMP),$D(^[QUI]FULL(YA,PCHCOMP)) K PCHCOMP G END
 S VOK=0 G FIN11
Q W *
 F NOR=1:1:BOU+1 S DO=$P(VALS,"/",NOR),DON(NOR)=DO
 I DON(BOU+1)="" K DON(BOU+1)
 Q
 R RC S DE=5,FI=$Y D ^%ABNETTO Q
INVALID G:BATCH'=0 REFUS D ^%VSQUEAK S DX=10,DY=10 X XY W VPA," est une valeur inacceptable pour ",PARA R RC S FI=10,DE=10 D ^%ABNETTO S:BATCH'=0 OUT=1 G GET
TOSTOC S TT="^[QUI]TREEWORK(NUFA,"_TWREF_")",$P(@TT,"^",4)=IDSTO
 S FCONT=1 Q:NUFA=("Sous-etude "_$I)  D ^TO3DEJFA,^TO3STOC S OUT=FCONT=0 Q
 S DE=22,FI=23 D ^%ABNETTO K BOU,CHP,DO,FCONT,GRAPH,HE,HERIT,IDSTO,NOR,NPAR,ORD,PARS,POO,QTTE,RC,RET,TT,VALS,VOK,YYBB,ZART Q
VERICP Q:^TOZE($I,"EXEC")=1
 I ('($D(^[QUI]UNKN(YA))))&(('($D(^[QUI]AMBI(YA))))&('($D(^[QUI]AMBICYCL(YA))))) Q
 D ^%VSQUEAK,CLEPAG^%VVIDEO S DXG=1,DXD=38,DYH=5,DYB=15,GRAPH=1,MSG="EXECUTION REFUSEE" D TO4^%VZCD S MSG=YA,DY=7,DX=20-($L(MSG)\2) X XY W YA S MSG="Comprehension imparfaite",DY=13,DX=20-($L(MSG)\2) X XY W MSG D POCLEPA^%VVIDEO W " [RETURN] " R *RET:30 S OUT=1 Q
REFUS S %ABEND=1,^CSTEST($I,"UNDEF",PARA_"("""_VPA_""")")=1,^CSTEST($I,"ERREUR")="Valeur du paramatre explicite "_PARA_" illegale" G FIN
COMP S CP=-1,TB1="^COMPNOM($I,YA)",TB2="^PHASADM($I,NUFA,""COMP"")",TB3="^[QUI]NOMENC(CP)"
 F %U=0:0 S CP=$N(@TB1@(CP)) Q:CP=-1  S @TB2@(CP)=1,^PHASADM($I,NUFA,"COMPOS",CP)=1,FIS=-1 F %U=0:0 S FIS=$N(@TB3@(FIS)) Q:FIS=-1  S ^PHASADM($I,NUFA,"DEFCOMP",FIS,CP)=1
 K TB1,TB2,TB3,CP,FIS Q
COMP2 S ^PHASADM($I,NUFA,"COMP","ART",YB,TWREF)=1,CP=-1,TB1="^[QUI]NOMENC(YA)",TB2="^PHASADM($I,NUFA,TWREF,""COMP"")" F %U=1:1 S CP=$N(@TB1@(CP)) Q:CP=-1  S @TB2@(CP)=1
 D ^TO3RPERE S ^PHASADM($I,NUFA,"COMP","OK",YB)=TWREF,^PHASADM($I,NUFA,TWRP,"COMP","OK",YB)=TWREF K ^PHASADM($I,NUFA,"COMP",YB),^PHASADM($I,NUFA,TWRP,"COMP",YB),TB1,TB2 Q
NLOPAR S IDSTO=IDSTO_"/"_^V($I,YA,PARA) G LOPAR

