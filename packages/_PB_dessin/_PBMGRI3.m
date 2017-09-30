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

;%PBMGRI3^INT^1^59547,73873^0
PTGR3IMP ;
 
 
 
 
 
 
 S %9MOD=(3E-1*$S(NBL>NBNH:NBL,1:NBNH))/8,ET=400,MX=4090,MY=3119,BX=100,BY=100,EX=MX-(2*BX),EY=((MY-ET)-(2*BY))\NBL,%ARBRE=1
 D POCLEPA^%VVIDEO W "Le graphe tient sur ",CP," page(s) ... [RETURN]" R *BID D TOUCHE^%INCCLAV(BID,.BID)
L1 
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression sur")_" " S Y1=$$^%VZESOR("E")
 I Y1=0 G ECRAN
 I Y1=1 G IMP
 G FIN
ECRAN 
 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,POCLEPA^%VVIDEO W "Quelle page voulez-vous ? : " S DX=$X D ^%VLEC G:CTRLA=1 FIN S P=Y1 G:P="" FIN
 D POCLEPA^%VVIDEO S %TERM=^TABIDENT(WHOIS,"TYPECR"),%PORT=^TABIDENT(WHOIS,"ECRGRA"),%INTER=1 D IMPAG,^%PBPZALF,POCLEPA^%VVIDEO W "La voulez-vous sur table tracante (O/N) ? [N] : " R *BID D TOUCHE^%INCCLAV(BID,.BID) S:BID=13 BID=78 G:BID=78 L1
IMP D POCLEPA^%VVIDEO S Y1=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous imprimer toutes les pages")_"? ","N") G:Y1=-1 L1
 S %TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA"),%INTER=0
 I '($$^%EDPRLG) G FIN2
 S %FONC="LANDSCAPE" D ^%PBPZ
 S (%9O,^V($J,"%","%ORIENTATION",1))="HORIZONTALE"
 S %PAUSE=0 I %TERM["RD-GL" S %PAUSE=1
 I %PAUSE D ^%VZEAVT("Mettez une nouvelle feuille sur la table tracante ")
 I '(Y1) D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,POCLEPA^%VVIDEO W "Quelle page voulez-vous ? : " S DX=$X D ^%VLEC G:CTRLA=1 L1 S P=Y1 G:P="" L1 D POCLEPA^%VVIDEO W "Page en cours d'impression ..." D IMPAG G L1
 F III=1:1:CP D POCLEPA^%VVIDEO W "Page "_III_" en cours d'impression ..." S P=III D IMPAG I %PAUSE D ^%VZEAVT("Mettez une nouvelle feuille sur la table tracante ")
 G L1
FIN S %TERM=^TABIDENT(WHOIS,"TYPECR"),%PORT=^TABIDENT(WHOIS,"ECRGRA")
 D ^%PBPZALF,POCLEPA^%VVIDEO W "Impression terminee ... [RETURN]" R *BID D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,CLEPAG^%VVIDEO
 
FIN2 D ^%EDEPLG
 K A,%A,%ABREV,BID,BX,BY,%9CL,ECX,ET,EX,EY,%FONC,%9HOR,I,%INTER,%LEC,%LIBEL,%9LXY,N,%N,MX,MY,P,PO,%PO,%9T,%9TC,%9VER,X,%9X,XC,Y,%9Y,YL,%ARBRE,III,%PAUSE
 Q
IMPAG N %DESSIN,%9O S %DESSIN=1
 K POS C %PORT O %PORT
 
 S %9T=16
 S %FONC="INIT.DESSIN" K %9NCO,%9NLI D ^%PBPZ
 S %FONC="CLEAR" D ^%PBPZ S %FONC="CADRE" D ^%PBPZ
 S TEXT(3)="Feuille no : "_P_"/"_CP
 D TEXT S BID=-1
 I %INTER S %FONC="LTEXTMAX",%9LTMX=100\NBNH D ^%PBPZ
 S %FONC="TAILLE",%9MOD=3E-1 D ^%PBPZ
 S %FONC="CRAYON",%9TC="PLUME",%9CL="NOIR" D ^%PBPZ
 S PROG="TEXN",N=-1
 F %N=0:0 S N=$N(^PAGE($J,P,N)) Q:N=-1  R:%INTER *BID:0 D TOUCHE^%INCCLAV(BID,.BID) Q:BID=1  D IMPN
 I %INTER S %FONC="LTEXTMAX",%9LTMX=999 D ^%PBPZ
 Q:BID=1  S %FONC="CRAYON",%9TC="FEUTRE",%9CL="VERT" D ^%PBPZ
 S PROG="SYBN",N=-1
 F %N=0:0 S N=$N(^PAGE($J,P,N)) Q:N=-1  R:%INTER *BID:0 D TOUCHE^%INCCLAV(BID,.BID) Q:BID=1  D IMPN
 Q:BID=1  S %FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ
 S A=-1
 F %A=0:0 S A=$N(^ARC($J,P,A)) Q:A=-1  R:%INTER *BID:0 D TOUCHE^%INCCLAV(BID,.BID) Q:BID=1  D IMPA
 Q:BID=1  S %TYPLOGO=3,%COUL=1,%9X=3700,%9Y=2900,%Z=5E-1,%LIBEL=0 D ^%PBMLOM
 S %FONC="PRINTER" D ^%PBPZ
 C %PORT O $I
 Q
IMPN S NL=-1 F %NL=0:0 S NL=$N(^PAGE($J,P,N,NL)) Q:NL=-1  S PO=-1 F %PO=0:0 S PO=$N(^PAGE($J,P,N,NL,PO)) Q:PO=-1  D @PROG
 Q
POSXY S ECX=EX\^PAGE($J,P,YL,"POS"),XC=(XC*ECX)+BX,YL=(MY-ET)-(YL*EY) Q
TEXN S %DESSIN=0,%FONC="DIMP",%9HOR=1,%9VER=2E-1 D ^%PBPZ
 S %FONC="TAILLE.PETITE",%9T=36 D ^%PBPZ
 S XC=PO,YL=NL D POSXY S (X,%9X)=XC,(Y,%9Y)=YL D CONV
 S %FONC="MOUVREL",%9X=40,%9Y=0 D ^%PBPZ
 
 
 S %LIBEL=N D ^TOTBABRV S %9STR=%ABREV
 S %FONC="TEXT" D ^%PBPZ
 S %9STR=""
 I $D(^REF($J,P,N,NL,PO)) S %9STR=%9STR_"P:"_^REF($J,P,N,NL,PO)
 I $D(^REFH($J,P,N,NL,PO)) S %9STR=%9STR_"PH:"_^REFH($J,P,N,NL,PO)
 I $D(^REFV($J,P,N,NL,PO)) S %9STR=%9STR_"PV:"_^REFV($J,P,N,NL,PO)
 Q:%9STR=""
 S %9X=X,%9Y=Y D CONV
 S %FONC="MOUVREL",%9X=-40,%9Y=-60 D ^%PBPZ
 S %FONC="DIMP" K %9HOR,%9VER D ^%PBPZ
 S %FONC="TEXT" D ^%PBPZ
 Q
IMPA S A1=-1 F %A1=0:0 S A1=$N(^ARC($J,P,A,A1)) Q:A1=-1  S XC=$P(A,"^",3),YL=$P(A,"^",2) D POSXY S %9LXY=XC_","_YL_",",XC=$P(A1,"^",3),YL=$P(A1,"^",2) D POSXY S %9LXY=%9LXY_XC_","_YL,%FONC="LIGBRI" D ^%PBPZ
 Q
SYBN S XC=PO,YL=NL D POSXY S %9X=XC,%9Y=YL D CONV
SYMB I '($D(^GRAPH($J,N))) G FEUIL
 I '($D(^GRAPH($J,N))#10) G ROND
 I ^GRAPH($J,N)="TRIANGLE" G TRIAN
 I ^GRAPH($J,N)="ROND" G ROND
 I ^GRAPH($J,N)="ANTI-TRIANGLE" G ATRI
 G ROND
FEUIL S %FONC="MOUVREL",%9X=20,%9Y=-20 D ^%PBPZ S %FONC="LBREL",%9LXY="0,0,0,40,-40,0,0,-40,40,0" D ^%PBPZ Q
ATRI S %FONC="MOUVREL",%9X=0,%9Y=-20 D ^%PBPZ S %FONC="LBREL",%9LXY="0,0,20,40,-40,0,20,-40" D ^%PBPZ Q
TRIAN S %FONC="MOUVREL",%9X=20,%9Y=-20 D ^%PBPZ S %FONC="LBREL",%9LXY="0,0,-20,40,-20,-40,40,0" D ^%PBPZ Q
ROND S %FONC="MOUVREL",%9X=20,%9Y=0 D ^%PBPZ S %FONC="ARCREL",%9X=-20,%9Y=0,%9R=20,%9AD=0,%9AF=3599E-1 D ^%PBPZ Q
TEXT S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="LIGBRI",%9LXY="0,"_(MY-ET)_","_MX_","_(MY-ET) D ^%PBPZ
 F I=1:1:3 D TEXTL
 Q
TEXTL Q:'($D(TEXT(I)))  S %9X=100,%9Y=MY-(I*100),%FONC="MOUV" D ^%PBPZ
 S %FONC="TEXT",%9STR=TEXT(I) D ^%PBPZ Q
CONV N %FONC
 S %FONC="CONVERSION.X" D ^%PBPZ
 S %FONC="CONVERSION.Y" D ^%PBPZ
 S %FONC="MOUV" D ^%PBPZ
 Q

