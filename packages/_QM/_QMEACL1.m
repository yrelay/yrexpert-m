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

;%QMEACL1^INT^1^59547,73877^0
QMEACL1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFF(XG,YH,LA,HA,DON) 
 N %F,%C,DX,DY,I,STOP,R,X1,DEL,LO,CTR
 N COLDEP,COLFIN,LARG,LIGDEP,NOCOL,NOPAG,POSIT,PC,PL,PX,PY
 N OLD,Y1,PCX,PCY,C1,YG,RR
 N TO,FL,CT,ES,%CT
 S COLDEP=1,LIGDEP=1,NOPAG=1,NOCOL=1,PC=2
 D REAFF^%QMEACL2(XG,YH,LA,HA)
 S PY=$O(@DESDON@(NOPAG,"")),PX=$O(@DESDON@(NOPAG,PY,"")),DEL=0
MOUV S PL=@DESDON@(NOPAG,PY,PX,"ORD"),LO=@DESDON@(NOPAG,PY,PX,"LON")
 
 
 
 
 D CUR S RR=$$MORE^%VZATOU(.TO,.FL,.CT,.ES,^TOZE($I,"ATTENTE"),0)
 D ECHON^%VVIDEO
 I '(RR) S X1=6 G 6
 I FL'="" S X1=FL G:"HBGD"[FL @FL
 I CT'="" S %CT=($A(CT)-$A("A"))+1,X1=%CT F %C=1,6,7,8,10,12,13,16,21,24,18 G:%C=%CT @%C
 
 F %C=43,45,61,95 I %C=TO S X1=TO G @%C
 S X1=TO
 
LECCHAMP S C1=$S(DEL:"",1:$C(X1)),OLD=@DON@(PL)
 
 D LIRE^%VREAD("",C1,(PX+XG)-1,(PX+XG)+LO,PY+YH,(PY+YH)-1,.CTR,.Y1)
 S OK=$$UC^%QMEAAC1(RAFFICH,BASE,IND,.Y1,PL)
 I '(OK) D ^%VSQUEAK,REAFV(OLD) G:DEL LECCHAMP G MOUV
FIN D REAFV(Y1) S @DON@(PL)=Y1,DEL=0
 D NEXT G MOUV
B 
 S PY=$O(@DESDON@(NOPAG,PY)) S:PY="" PY=$O(@DESDON@(NOPAG,""))
 S PX=$O(@DESDON@(NOPAG,PY,PX-1)) S:PX="" PX=$ZP(@DESDON@(NOPAG,PY,PX))
 G MOUV
H 
 S PY=$ZP(@DESDON@(NOPAG,PY)) S:PY="" PY=$ZP(@DESDON@(NOPAG,""))
 S PX=$O(@DESDON@(NOPAG,PY,PX-1)) S:PX="" PX=$ZP(@DESDON@(NOPAG,PY,PX))
 G MOUV
G 
 D PREC G MOUV
D 
 D NEXT G MOUV
1 
 Q
6 
 Q
7 
 G:'($D(@DON@(PL))) ERR
 G:@DON@(PL)="" ERR
 S DX=PX+XG,DY=PY+YH X XY W $J("",LO)
 S @DON@(PL)="",DEL=1
 G LECCHAMP
8 
 D HELP^%QMEACL2
 G MOUV
10 
 D IMPR^%QMEACL2(NOPAG)
 G MOUV
12 
 S HOVER=$S(HOVER="H":"V",1:"H")
 D POSIT^%QMEAAC1(DES,HOVER,DESAT,DESDON)
 S NOPAG=1
 D REAFF^%QMEACL2(XG,YH,LA,HA)
 S PY=$O(@DESDON@(NOPAG,"")),PX=$O(@DESDON@(NOPAG,PY,""))
 G MOUV
13 
 D NEXT
 G MOUV
16 
 D AFPRES^%QMEACL2(RP,S,XG1,YG1,LH1,LV1,0)
 G MOUV
18 
 D REAFF^%QMEACL2(XG,YH,LA,HA)
 G MOUV
21 
24 
 D AIDE^%QMEAAC1(RAFFICH,BASE,IND,PL) G MOUV
61 
43 
 D PLUS(.R) D:R=1 INIT G MOUV
95 
45 
 D MOINS(.R) D:R=1 INIT G MOUV
ERR 
 D ^%VSQUEAK G MOUV
 
 
 
REAFV(V) 
 S DX=PX+XG,DY=PY+YH X XY W $J("",LO)
 S DX=PX+XG,DY=PY+YH X XY W $E(V,1,LO),$J("",LO-$L(V)) Q
 
MOINS(R) 
 I NOPAG=1 D ^%VSQUEAK S R=0 Q
 S NOPAG=NOPAG-1 D REAFF^%QMEACL2(XG,YH,LA,HA)
 S R=1 Q
 
PLUS(R) 
 I '($D(@DESDON@(NOPAG+1))) D ^%VSQUEAK S R=0 Q
 S NOPAG=NOPAG+1 D REAFF^%QMEACL2(XG,YH,LA,HA)
 S R=1 Q
 
INIT 
 S PY=$O(@DESDON@(NOPAG,"")),PX=$O(@DESDON@(NOPAG,PY,"")),DEL=0
 Q
 
NEXT 
 S PX=$O(@DESDON@(NOPAG,PY,PX)) Q:PX'=""
 S PY=$O(@DESDON@(NOPAG,PY))
 S:PY="" PY=$O(@DESDON@(NOPAG,""))
 S PX=$O(@DESDON@(NOPAG,PY,""))
 Q
 
PREC 
 S PX=$ZP(@DESDON@(NOPAG,PY,PX)) Q:PX'=""
 S PY=$ZP(@DESDON@(NOPAG,PY))
 S:PY="" PY=$ZP(@DESDON@(NOPAG,""))
 S PX=$ZP(@DESDON@(NOPAG,PY,""))
 Q
 
CUR 
 S DX=PX+XG,DY=PY+YH X XY Q
 
REAFF 
 D REAFF^%QMEACL2(XG,YH,LA,HA)
 Q

