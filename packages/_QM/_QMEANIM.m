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

;%QMEANIM^INT^1^59547,73877^0
%QMEANIM(S) 
 
 
 
 
 
 
 N L,LMAX,LNO,P,PAGE,A,V,ORD,LIB,VAL,LVAL,LAT,%I,BASE,OO
 S BASE="NOEUD.I",LNO=0,PAGE=0
 S P=^TABIDENT(WHOIS,"PRINTER"),LMAX=^TABIDENT(WHOIS,"IMPRCOUR")
 C P O P U P
 S A="",%I=1,LAT=0,LVAL=0
BOUCAT S A=$$NXTRI^%QSTRUC8(BASE,S,A)
 G:A="" IMPGL
 G:A="TRANSITION" BOUCAT
 S LIB=$P(A,".")
 G:(LIB="LIEN")!(LIB="INVERSE") BOUCAT
 S ORD=""
BOUCORD S ORD=$$NXTRIAO^%QSTRUC8(BASE,S,A,ORD)
 G:ORD="" BOUCAT
 S V=$$VALEUR^%QSTRUC8(BASE,S,A,ORD)
 S LIB=A_$S(ORD=1:"",1:"("_ORD_")")
 S:$L(LIB)>LAT LAT=$L(LIB)
 S GL(%I,"AT")=LIB,GL(%I,"VAL")=V
 S %I=%I+1
 G BOUCORD
IMPGL 
 D TETE
 S %I=1,NOL=1,MIL=LAT+1
IMPRB G:'($D(GL(%I))) SUIT
 W !," ",GL(%I,"AT")
 F NB=$X:1:MIL W " "
 W $E(GL(%I,"VAL"),1,132-MIL)
 S %I=%I+1,NOL=NOL+1 D CONT
 G IMPRB
SUIT S NOL=NOL+2 D CONT
 W !,!,!," ",$$^%QZCHW("Note en prologue")
 S LNO=LNO+1 D CONT
 I $$AIR^%QSGE5(BASE,S,"COMMENTAIRE.PROLOGUE") S ORD=$$NXTRIAO^%QSTRUC8(BASE,S,"COMMENTAIRE.PROLOGUE",""),NOT=$$VALEUR^%QSTRUC8(BASE,S,"COMMENTAIRE.PROLOGUE",NOT,ORD) D IMPNOT(NOT,ORD,"   ")
 S LNO=LNO+2 D CONT
 W !,! D CONT
 W !," ",$$^%QZCHW("Note en epilogue")
 S LNO=LNO+1 D CONT
 I $$AIR^%QSGE5(BASE,S,"COMMENTAIRE.EPILOGUE") S ORD=$$NXTRIAO^%QSTRUC8(BASE,S,"COMMENTAIRE.EPILOGUE",""),NOT=$$VALEUR^%QSTRUC8(BASE,S,"COMMENTAIRE.EPILOGUE",ORD) D IMPNOT(NOT,ORD,"   ")
 W ! S LNO=LNO+1 D CONT
 S OO=""
BTRANS S OO=$$NXTRIAO^%QSTRUC8(BASE,S,"LIEN.TRANSITION",OO)
 G:OO="" FIN
 S V=$$VALEUR^%QSTRUC8(BASE,S,"LIEN.TRANSITION",OO)
 S LNO=LNO+2 D CONT
 W !,!," ",$$^%QZCHW("Transition vers le noeud "),$$^%QSCALVA($$LIENI^%QSGEL3,V,"DESTINATION.TRANSITION"),$$^%QZCHW(" ,si")
 S LNO=LNO+1 D CONT
 S ORD=""
BOTRANS S ORD=$$NXTRIAV^%QSTRUC8($$LIENI^%QSGEL3,V,"CONDITION.TRANSITION",ORD)
 G:ORD="" BTRANS
 W !,"   ",ORD
 S LNO=LNO+1
 G BOTRANS
FIN C P U 0
 Q
 
CONT D:LNO>(LMAX-5) TETE
 Q
 
TETE S PAGE=PAGE+1
 W #
 W !,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE,?40,$$^%QZCHW("Noeud logique : "),S
 W !,$$^%QZCHW("Page : "),PAGE
 W !,!
 S LNO=4 Q
 
IMPNOT(TITRE,ORD,VID) 
 N NLIG,%NLIG
 W !,VID,"    ",TITRE
 S LNO=LNO+1 D CONT
 Q:'($D(^[QUI]QUERYT(BASE,S,ORD)))
 S NLIG=""
 F %NLIG=0:0 S NLIG=$O(^[QUI]QUERYT(BASE,S,ORD,"LIGNE",NLIG)) Q:NLIG=""  W !,VID,^[QUI]QUERYT(BASE,S,ORD,"LIGNE",NLIG) S LNO=LNO+1 D CONT
 Q

