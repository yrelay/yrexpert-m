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

;%PBMHIS^INT^1^59547,73873^0
PTHIST ;
 
 
 
 
 
 Q:'($D(^HISTO($J,"NBCOL")))
 Q:^HISTO($J,"NBCOL")=0
 S:'($D(%DRAP)) %DRAP=1
 S:'($D(%TEXT)) %TEXT=1
 S:'($D(%INTER)) %INTER=0
 S Q=0,NBT=6,CPTCOL=0,NBCT=(^HISTO($J,"NBCOL")\10)+1,LX=3900,XX=100,YY=350,MAXX=4090,MAXY=3119,LY=MAXY
 S TICK=25,DLIG=100,DEPLIG=100,DCX=LX\(^HISTO($J,"NBCOL")+1),LX=LX-DCX,DCY=LY,%FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR"
 D TEXT,HIST
 S M=$J(M/^HISTO($J,"NBCOL"),1,3),%FONC="MOUV",%9X=1500,%9Y=75 D ^%PBPZ
 S %FONC="TEXT",%9STR="Moyenne = "_M D ^%PBPZ
 D:'(Q) LOGO,COPY
 K BIDON,CPTCOL,DCX,DCY,I,LX,LY,M,MAXX,MAXY,NBT,NOLIG,Q,RED,TICK,XX,YY
 Q
HIST 
 S M=0,LY=LY-(2*YY),RED=LY/($S(^HISTO($J,"HAUTEUR-MAX")=0:LY,1:^HISTO($J,"HAUTEUR-MAX"))+DCX)
 S %FONC="SEGMENT",%9X1=XX,(%9Y1,%9Y2)=YY,%9X2=(^HISTO($J,"NBCOL")*DCX)+XX D ^%PBPZ
 S %9Y1=YY-TICK,%9Y2=YY F I=0:1:^HISTO($J,"NBCOL") S (%9X1,%9X2)=(I*DCX)+XX D ^%PBPZ
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S I=-1,II=1,%FONC="TAILLE",%9MOD=NBT/^HISTO($J,"NBCOL") D:%9MOD<1 ^%PBPZ
B1 S I=$N(^HISTO($J,"COL",I)) G:I=-1 F1 D COLON Q:Q  S II=II+1 G B1
F1 S %FONC="CRAYON",%9TC="PLUME",%9CL="ROUGE" D ^%PBPZ S I=-1,II=1
B2 S I=$N(^HISTO($J,"COL",I)) G:I=-1 F2 D DRAPEAU Q:Q  S II=II+1 G B2
F2 S %FONC="TAILLE",%9MOD=^HISTO($J,"NBCOL")/NBT D:%9MOD>1 ^%PBPZ Q
 
COPY S %TYPLOGO=3,%9X=3800,%9Y=50,%Z=35E-2,%COUL=1,%LIBEL=0
 D ^%PBMLOM Q
LOGO Q:'($D(^LOGO(WHOIS)))  S %Z=5E-1,%9X=100,%9Y=100 D ^%PBLOGO Q
TEXT S (I,NOLIG)=0
BTEX S I=I+1 G:'($D(^HISTO($J,"TEXT",I))) FTEX S NOLIG=NOLIG+1,%FONC="MOUV",%9Y=MAXY-(DLIG*I),%9X=DEPLIG D ^%PBPZ
 I $D(^HISTO($J,"TEXT",I,"POLICE")) S %FONC="POLICE",%9P=^HISTO($J,"TEXT",I,"POLICE") D ^%PBPZ
 I '($D(^HISTO($J,"TEXT",I,"POLICE"))) S %FONC="POLICE",%9P="STANDARD" D ^%PBPZ
 I $D(^HISTO($J,"TEXT",I,"TYPE-CRAYON"))&$D(^HISTO($J,"TEXT",I,"COULEUR")) S %FONC="CRAYON",%9TC=^HISTO($J,"TEXT",I,"TYPE-CRAYON"),%9CL=^HISTO($J,"TEXT",I,"COULEUR") D ^%PBPZ
 I ('($D(^HISTO($J,"TEXT",I,"TYPE-CRAYON"))))!('($D(^HISTO($J,"TEXT",I,"COULEUR")))) S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 I $D(^HISTO($J,"TEXT",I,"TAILLE")) S %FONC="TAILLE",%9MOD=^HISTO($J,"TEXT",I,"TAILLE") D:%9MOD<1 ^%PBPZ
 S %FONC="TEXT",%9STR=^HISTO($J,"TEXT",I) D ^%PBPZ
 I $D(^HISTO($J,"TEXT",I,"TAILLE")) S %FONC="TAILLE",%9MOD=^HISTO($J,"TEXT",I,"TAILLE") D:%9MOD>1 ^%PBPZ
 G BTEX
FTEX S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="SEGMENT",%9X1=0,%9X2=MAXX,LY=LY-((NOLIG+1)*DLIG),(%9Y1,%9Y2)=LY D ^%PBPZ
 S (%9Y1,%9Y2)=200 D ^%PBPZ Q
 
COLON D:%INTER INTER Q:Q
 S M=M+^HISTO($J,"COL",I),%FONC="LIGBRI",%9LXY=((DCX*(II-1))+XX)_","_YY_","_((DCX*(II-1))+XX)_","_((^HISTO($J,"COL",I)*RED)+YY)_","_((DCX*II)+XX)_","_((^HISTO($J,"COL",I)*RED)+YY)_","_((DCX*II)+XX)_","_YY D ^%PBPZ
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="MOUV",%9X=((DCX*(II-1))+XX)-TICK,%9Y=YY-(3*TICK) D ^%PBPZ S %FONC="TEXT",%9STR=^HISTO($J,"COL",I,"TEXT") D:%TEXT!(CPTCOL=0) ^%PBPZ S CPTCOL=(CPTCOL+1)#NBCT
 I II=^HISTO($J,"NBCOL") D CALCOL2,COLONF Q
 D CALCOL G @$S(^HISTO($J,"COL",I)>^HISTO($J,"COL",I+1):"COLON2",^HISTO($J,"COL",I)=^HISTO($J,"COL",I+1):"COLON1",^HISTO($J,"COL",I)<^HISTO($J,"COL",I+1):"COLON3") Q
CALCOL S X1=(DCX*(II-1))+XX,(Y1,Y4)=(^HISTO($J,"COL",I)*RED)+YY,X2=(DCX\2)+X1,(Y2,Y3)=(DCX\3)+Y1,X4=(DCX*II)+XX,(X3,X5)=(DCX\2)+X4,Y5=((^HISTO($J,"COL",$N(^HISTO($J,"COL",I)))*RED)+YY)+(DCX\3)
 Q
CALCOL2 S X1=(DCX*(II-1))+XX,(Y1,Y4)=(^HISTO($J,"COL",I)*RED)+YY,X2=(DCX\2)+X1,(Y2,Y3)=(DCX\3)+Y1,X4=(DCX*II)+XX,(X3,X5)=(DCX\2)+X4
 Q
COLON1 S %FONC="LIGBRI",%9LXY=X1_","_Y1_","_X2_","_Y2_","_X3_","_Y3_","_X4_","_Y4
 D ^%PBPZ Q
COLON2 S %FONC="LIGBRI",%9LXY=X1_","_Y1_","_X2_","_Y2_","_X3_","_Y3_","_X4_","_Y4 D ^%PBPZ
 S %FONC="SEGMENT",%9X1=X3,%9Y1=Y3,%9X2=X5,%9Y2=Y5 D ^%PBPZ
 Q
COLON3 S %FONC="LIGBRI",%9LXY=X1_","_Y1_","_X2_","_Y2_","_X4_","_Y3 D ^%PBPZ
 Q
COLONF S %FONC="LIGBRI",%9LXY=X1_","_Y1_","_X2_","_Y2_","_X3_","_Y3_","_X4_","_Y4 D ^%PBPZ
 S %FONC="LIGBRI",%9LXY=X3_","_Y3_","_X3_","_((DCX\3)+YY)_","_X4_","_YY D ^%PBPZ
 Q
 
DRAPEAU D:%INTER INTER Q:Q
 S %FONC="POLICE",%9P="ITALIQUE" D ^%PBPZ
 S %FONC="MOUV",%9X=((DCX*(II-1))+XX)+(DCX/8),%9Y=((^HISTO($J,"COL",I)*RED)+YY)+(TICK\2) D ^%PBPZ
 I %DRAP S %FONC="LBREL",%9LXY=0_","_(DCX*105E-2)_","_0_","_((-(DCX))*5E-2)_","_(DCX*8E-1)_","_0_","_0_","_((-(DCX))*5E-1)_","_((-(DCX))*8E-1)_","_0 D ^%PBPZ S %FONC="MOUVREL",%9X=DCX*5E-2,%9Y=DCX*2E-1 D ^%PBPZ
 I '(%DRAP) S %FONC="MOUVREL",%9X=DCX*5E-2,%9Y=DCX*7E-1 D ^%PBPZ
 S %FONC="TEXT",%9STR=^HISTO($J,"COL",I) D ^%PBPZ
 S %FONC="POLICE",%9P="STANDARD" D ^%PBPZ Q
INTER R *BIDON:0 D TOUCHE^%INCCLAV(BIDON,.BIDON) S Q=BIDON=1 Q

