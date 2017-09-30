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

;%VMENGEN^INT^1^59547,74035^0
GEMENGEN ;
 ;;         generation de la structure d'un menu 
 ;;
 ;;    MES = nom du global contenant les options du menu
 ;;    MAXCAR = nb de caract. du + grand libelle
 ;;    DL = espace horizontal entre 2 libelles
 ;;    DC =   "    vertical     "   "    "      
 ;;
 
 
 S:DL=0 DL=1 S:DC=0 DC=1 S PAG=1,OP=$S(($D(@MES)#10)=1:$P(@MES,"^",4),1:0) D KILL(PG) S LI="",LMX=(XD-XG)-1,LC=YH,CC=XG+1 S:LC>23 LC=23 S ^GM4($I,PG,PAG,LC)="",%U="",NO=0,LGI=0,MAXCAR=0,NBOP=0
 G:ALIGN=0 PLUSCOL
 F %F=0:0 S %U=$O(@MES@(%U)) Q:%U=""  S LIB=$$^%QZCHW($$GETLBLAN^%VTLBLAN($P(@MES@(%U),"^",1))),LGC=$L($TR(LIB,"#","")),NBOP=NBOP+1 S:MAXCAR<LGC MAXCAR=LGC
 S LNUM=$L(NBOP) S:DL<(LNUM+3) DL=LNUM+3
 S NBCOL=LMX\(MAXCAR+DL) S:NBCOL=0 NBCOL=1
 I (NBCOL=1)!(SEUL=1) S SEUL=1,NBCOL=1 G UNECOL
 S NBRES=(LMX-DL)-(NBCOL*(MAXCAR+DL)) S:NBRES<0 NBRES=0
 S:NBRES'<DL NBRES=NBRES-DL
 S AJ=NBRES\NBCOL,DL=DL+AJ G PLUSCOL
UNECOL 
 S DIF=LMX-MAXCAR
 I DIF<0 S DL=0 G PLUSCOL
 I DIF<(LNUM+2) S DL=DIF G PLUSCOL
 I (DIF\2)<(LNUM+2) S DL=LNUM+2 G PLUSCOL
 S DL=((DIF+LNUM)\2)+1
PLUSCOL 
 S CC=XG+DL,LGI=0
 
 
 
LU S %U=$O(@MES@(%U)) G:%U="" FLU S %V=@MES@(%U),%W=$P(%V,"^",2,999),%V=$$GETLBLAN^%VTLBLAN($P(%V,"^",1)) S:^TOZE($I,"LG")'="FR" %V=$$^%QZCHW(%V)
 
 
 I $E(^TOZE($I,"AFMEN"))="M" S %V=$$MAJ^%VMINUSC(%V),%VINV=$$MIN^%VMINUSC(%V) G LU1
 S %VINV=$$MAJ^%VMINUSC(%V),%V=$$MIN^%VMINUSC(%V)
LU1 S %L=$L(%V)
 
 
 S:ALIGN=0 MAXCAR=$L(%V)
 S LGC=(LGI+MAXCAR)+DL,%V=%V_$J("",MAXCAR-$L(%V)),%VINV=%VINV_$J("",MAXCAR-$L(%VINV))
 
 
 I ((LGC>LMX)!(SEUL=1))&(LGI'=0) S LGI=0,CC=XG+DL,LC=LC+DC S:LC>YB LC=YH,PAG=PAG+1,NO=0 S ^GM4($I,PG,PAG,LC)=""
 
 
 
 S ^GM4($I,PG,PAG,LC)=^GM4($I,PG,PAG,LC)_%V_$J("",DL),^GM2($I,PG,PAG,LC,CC)=%V,^GM1($I,PG,PAG,$TR($S(%V["#":$P(%V,"#",2,999),1:%V),"#",""))=LC_"/"_CC,^GM3($I,PG,PAG,LC,CC)=%W,^GM6($I,PG,PAG,LC,CC)=$S($D(@MES@(%U,"COM")):$$^%QZCHW(@MES@(%U,"COM")),1:"")
 
 
 S LGI=(LGI+MAXCAR)+DL,^GM1($I,PG,PAG,$TR($S(%VINV["#":$P(%VINV,"#",2,999),1:%VINV),"#",""))=LC_"/"_CC G:NUM=0 LUSS S NO=NO+1,^GM1($I,PG,PAG,NO)=LC_"/"_CC,^GM7($I,PG,PAG,LC,CC)=NO
 
LUSS I $D(@MES@(%U,"EQU")) S EQ=@MES@(%U,"EQU") F %Z=1:1 S %EQI=$$^%QZCHW($P(EQ,"^",%Z)) Q:%EQI=""  D EQUIV
 S CC=(CC+MAXCAR)+DL G LU
EQUIV S %V=$$MAJ^%VMINUSC(%EQI),%VINV=$$MIN^%VMINUSC(%EQI)
 S ^GM1($I,PG,PAG,%V)=LC_"/"_CC,^GM1($I,PG,PAG,%VINV)=LC_"/"_CC,^GM5($I,PG,PAG,LC,CC)=%EQI
 Q
 
FLU S LI=$ZP(^GM2($I,PG,1,""))+1,%Z=0 S:LI>23 LI=23 S:($D(@MES)#10)=1 %Z=1,LC=$P(@MES,"^",1),CC=$P(@MES,"^",2),EQ=$P(@MES,"^",3)
 S ^GM6($I,PG)=$S(%Z=1:$S((LC>YH)&(LC<LI):LI,1:LC),1:LI)_"^"_$S(%Z=1:$S(CC<EQ:CC_"^"_EQ,1:XG_"^"_XD),1:XG_"^"_XD)_"^0"
FIN S:'($D(RM)) RM=80 O 0 K %Z,%EQI,EQ,LI,LGI,LC,LMX,CC Q
KILL(MN) 
 K ^GM1($I,MN),^GM2($I,MN),^GM3($I,MN),^GM4($I,MN),^GM5($I,MN),^GM6($I,MN),^GM7($I,MN) Q

