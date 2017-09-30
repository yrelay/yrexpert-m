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

;%PBMGRI4^INT^1^59547,73873^0
PTGR3IMP ;
 
 S %9MOD=(3E-1*$S(NBL>NBNH:NBL,1:NBNH))/8,ET=400,MX=4090,MY=3119,BX=100,BY=100,EX=(MX-(2*BX))\NBNH,EY=((MY-ET)-(2*BY))\NBL
 D ^%PBPZALF,POCLEPA^%VVIDEO W "Le graphe tient sur ",CP," page(s) ... [RETURN]" R *BIDON D POCLEPA^%VVIDEO F %LEC=0:0 D ^%PBPZALF,POCLEPA^%VVIDEO W "Quelle page voulez-vous ? : " R P G:P="" FIN D IMPAG
 D ^%PBPZALF,POCLEPA^%VVIDEO W "Impression terminee ... [RETURN]" R *BIDON D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,CLEPAG^%VVIDEO
FIN K A,%A,BIDON,BX,BY,%9CL,ET,EX,EY,%FONC,%9HOR,I,%LEC,%9LXY,N,%N,MX,MY,P,PO,%PO,%9TC,%9VER,X,%9X,Y,%9Y Q
IMPAG K POS D ^%PBPZALF,POCLEPA^%VVIDEO W "Page numero : ",P,"/",CP," ... [RETURN]" R *BIDON D POCLEPA^%VVIDEO,^%PBPZGRA,^%PBPZCLR
 C %PORT O %PORT
 S %FONC="INIT" K %9NCO,%9NLI D ^%PBPZ S %FONC="CLEAR" D ^%PBPZ S %FONC="CADRE" D ^%PBPZ
 S TEXT(3)="Feuille no : "_P_"/"_CP
 D TEXT
 S %FONC="TAILLE",%9MOD=3E-1 D ^%PBPZ
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S PROG="TEXN",N=-1 F %N=0:0 S N=$N(^PAGE($J,P,N)) Q:N=-1  D IMPN
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="VERT" D ^%PBPZ
 S PROG="SYBN",N=-1 F %N=0:0 S N=$N(^PAGE($J,P,N)) Q:N=-1  D IMPN
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ
 S A=-1 F %A=0:0 S A=$N(^ARC($J,P,A)) Q:A=-1  D IMPA
 S %TYPLOGO=3,%COUL=1,%9X=3700,%9Y=2900,%Z=5E-1,%LIBEL=0 D ^%PBMLOM
 C %PORT O $I
 Q
IMPN S NL=-1 F %NL=0:0 S NL=$N(^PAGE($J,P,N,NL)) Q:NL=-1  D IMPL
 Q
IMPL S PO=-1 F %PO=0:0 S PO=$N(^PAGE($J,P,N,NL,PO)) Q:PO=-1  D @PROG
 Q
SYBN S %9X=((PO-1)*EX)+BX,%9Y=(MY-ET)-(NL*EY),%FONC="MOUV" D ^%PBPZ
 D SYMB
 Q
TEXN S %FONC="DIMP",%9HOR=1,%9VER=2E-1 D ^%PBPZ
 S %9X=((PO-1)*EX)+BX,%9Y=(MY-ET)-(NL*EY),%FONC="MOUV" D ^%PBPZ
 S %9STR=N,%FONC="TEXT" D ^%PBPZ
 S %9STR=""
 I $D(^REF($J,P,N,NL,PO)) S %9STR=%9STR_"  REF:"_^REF($J,P,N,NL,PO)
 I $D(^REFH($J,P,N,NL,PO)) S %9STR=%9STR_"  REFH:"_^REFH($J,P,N,NL,PO)
 I $D(^REFV($J,P,N,NL,PO)) S %9STR=%9STR_"  REFV:"_^REFV($J,P,N,NL,PO)
 Q:%9STR=""
 S %FONC="MOUV" D ^%PBPZ
 S %FONC="MOUVREL",%9X=-80,%9Y=-80 D ^%PBPZ
 S %FONC="DIMP" K %9HOR,%9VER D ^%PBPZ
 S %FONC="TEXT" D ^%PBPZ
 Q
IMPA S A1=-1 F %A1=0:0 S A1=$N(^ARC($J,P,A,A1)) Q:A1=-1  D IMPA1
 Q
 
IMPA1 S %9LXY=((($P(A,"^",3)-1)*EX)+BX)_","_((MY-ET)-($P(A,"^",2)*EY))_","_((($P(A1,"^",3)-1)*EX)+BX)_","_((MY-ET)-($P(A1,"^",2)*EY)),%FONC="LIGBRI" D ^%PBPZ
 Q
SYMB I '($D(^GRAPH($J,N))) D FEUIL Q
 I ^GRAPH($J,N)="TRIANGLE" D TRIAN Q
 D ROND
 Q
FEUIL S %FONC="MOUVREL",%9X=20,%9Y=-20 D ^%PBPZ S %FONC="LBREL",%9LXY="0,0,0,40,-40,0,0,-40,40,0" D ^%PBPZ S %FONC="MOUVREL",%9X=20,%9Y=20 D ^%PBPZ Q
TRIAN S %FONC="MOUVREL",%9X=20,%9Y=-20 D ^%PBPZ S %FONC="LBREL",%9LXY="0,0,-20,40,-20,-40,40,0" D ^%PBPZ S %FONC="MOUVREL",%9X=20,%9Y=20 D ^%PBPZ Q
ROND S %FONC="MOUVREL",%9X=20,%9Y=0 D ^%PBPZ S %FONC="ARCREL",%9X=-20,%9Y=0,%9R=20,%9AD=0,%9AF=3599E-1 D ^%PBPZ S %FONC="MOUVREL",%9X=20,%9Y=0 D ^%PBPZ Q
TEXT S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="LIGBRI",%9LXY="0,"_(MY-ET)_","_MX_","_(MY-ET) D ^%PBPZ
 F I=1:1:3 D TEXTL
 Q
TEXTL Q:'($D(TEXT(I)))  S %FONC="MOUV",%9X=100,%9Y=MY-(I*100) D ^%PBPZ
 S %FONC="TEXT",%9STR=TEXT(I) D ^%PBPZ Q

