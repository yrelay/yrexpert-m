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

;TOFONCTI^INT^1^59547,74872^0
TOFONCTI ;
 
 S WX=$X,WY=$Y D CLEPAG^%VVIDEO
 S DXG=0,DXD=39,DYH=0,DYB=4,TIT=$$^%QZCHW("DIVERSES FONCTIONS") D ^%AB3CADR
 
 S DX=15,DY=5,%STOP=0,%FIN=0,DX=$X-1 X XY W " ",! F I=1:1 S A=$T(FUN+I) Q:A=""  D:(I#17)=0 ALORS Q:%STOP=1  S POS=$S(I'<10:5,1:6),CHOI=$P(A,";;",2) F TP=1:1:3 D:TP=2 BLD^%VVIDEO W $P(CHOI,"#",TP) D:TP=2 NORM^%VVIDEO W:TP=3 !
 I %STOP=0 S %FIN=1 D ALORS
 G FIN
ALORS D POCLEPA^%VVIDEO
 I %FIN=1 W $$^%QZCHW("Fin de liste. [RETURN] pour continuer ") R *REP G FIN
 W $$L2^%QSLIB R *REP D TOUCHE^%INCCLAV(REP,.REP)
 S:REP=1 %STOP=1
 S DX=0,DY=6 D CLEBAS^%VVIDEO
FIN Q
FUN ;;
 ;;#$ABS#     $ABS(X)=Valeur absolue de X
 ;;#$MIN#     $MIN(X;Y;Z;...;N)=plus petite valeur de {X,Y,Z,...,N}
 ;;#$MAX#     $MAX(X;Y;Z;...;N)=plus grande valeur de {X,Y,Z,...,N}
 ;;#$MAJOR#   $MAJOR(X;Y;Z;..N)=plus petite valeur superieure ou egale a X
 ;;#$MINOR#   $MINOR(X;Y;Z;..N)=plus grande valeur inferieure ou egale a X
 ;;#$SOMME#   $SOMME(X;Y;Z;..N)=X+Y+Z+..+N
 ;;#$SIN#     $SIN(X)=Sinus de X
 ;;#$COS#     $COS(X)=Cosinus de X
 ;;#$TG#      $TG(X)=Tangente de X
 ;;#$COTG#    $COTG(X)=Cotangente de X
 ;;#$ARCSIN#  $ARCSIN(X)=Arc sinus de X
 ;;#$ARCOS#   $ARCOS(X)=Arc cosinus de X
 ;;#$ARCTG#   $ARCTG(X)=Arc tangeante de X
 ;;#$ARCOTG#  $ARCOTG(X)=Arc cotangeante de X
 ;;#$EXP#     $EXP(X)=Exponentiel de X avec X compris entre -69&69 inclus
 ;;#$PUIS#    $PUIS(X;Y)=X a la puissance Y avec Y entier relatif
 ;;#$FACT#    $FACT(X)=Factoriel de X avec X inferieur ou egal a 49
 ;;#$SQR#     $SQR(X)=Racine carre de X
 ;;#$SQ#      $SQ(X)=X au carre =$PUIS(X;2)
 ;;#$CT#      $CT(X;Y)=1 si X contient Y, =0 dans le cas contraire
 ;;#$CTI#     $CTI(X;Y)=Y si X contient Y, ="" dans le cas contraire
 ;;#$CTO#     $CTO(X,Y)="OUI" si X contient Y, ="NON" dans le cas contraire
 ;;#$SSCH#    $SSCH(X;i;j)=Sous chaine de X allant de i a j
 ;;                      exp : $SSCH("abcdefg";3;6)="cdef"
 ;;#$DMD#     $DMD("X") Totem demandra la valeur a affecter au parametre X
 ;;         $DMD("X";a;b;...;n) a,b,..,n sont les seules valeurs
 ;;                             affectables au parametre X
 ;;#$ARD#     $ARD(X;Y)=Arrondi de X avec Y decimales
 ;;         $ARD(X;Y;Z)=Arrondi de X avec Y decimales et au plus proche 
 ;;                     multiple de Z   ( ex:$ARD(1223.07;1;7)=1225.1 )
 ;;#$ARDB#    $ARDB(X)=Arrondi bas de X   ex: $ARDB(23.873)=23
 ;;#$ARDH#    $ARDH(X)=Arrondi haut de X  ex: $ARDH(23.001)=24
 ;;#$LN#      $LN(X)=Logarithme neperien de X
 ;;#$LOG#     $LOG(X;Y)=Logarithme de X en base Y
 ;;#$DATE#    $DATE   ==> ex 24/04/86 ,     $DATE(1) ==> ex 24/04/86
 ;;         $DATE(2)==> ex 24 Avril 1986, $DATE(3) ==> ex 860424
 ;;#$VARMECA# $VARMECA(X,Y,Z,E1,E2,E3,E4) calcule les valeurs de X,Y,Z a partir
 ;;         des expressions E1,E2,E3,E4 : X=E4/(PI*E2),Y=X*E1,Z=E3/Y
 ;;         E1:avance par tours,E2:diametre,E3:longueur,E4:vitesse
 ;;         X:nombre de tours,Y:avance par minutes,Z:temps du cycle
 ;;#$INDICE#  definit les valeurs que prend un indice
 ;;           $INDICE("DN";A;B;C) l'indice en question est numerique et prend
 ;;              les valeurs de A a B avec un pas de C. 
 ;;              Si C n'est pas specifie le pas est fixe a 1.
 ;;           $INDICE("D";A;B;C;D) l'indice en question est alphanumerique
 ;;              et prend les valeurs A,B,C,D

