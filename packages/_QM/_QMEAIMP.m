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

;%QMEAIMP^INT^1^59547,73877^0
%QMEAIMP(S) 
 
 
 
 
 
 N L,LMAX,LNO,P,PAGE,ENSATT,BASE
 K ENSATT
 S BASE="SAISIE.I",LNO=0,PAGE=0
 S P=^TABIDENT(WHOIS,"PRINTER"),LMAX=^TABIDENT(WHOIS,"IMPRCOUR")
 C P O P U P D TETE,TRAIT
 C P U 0 Q
 
TRAIT W !,"  ",$$^%QZCHW("Commentaires"),! S LNO=LNO+2
 W "    " S LNO=LNO+2
 W $$^%QSCALVA(BASE,S,"COMMENTAIRE")
 S LNO=LNO+1
 W !,! S LNO=LNO+2
 W !,"  ",$$^%QZCHW("Sens d'affichage"),! S LNO=LNO+2
 W "    " S LNO=LNO+2
 S V=$$^%QSCALVA(BASE,S,"SENS.AFFICHAGE")
 W $S(V="V":$$^%QZCHW("Vertical"),V="H":$$^%QZCHW("Horizontal"),1:"")
 S LNO=LNO+1
 W !,! S LNO=LNO+2
 W !,"  ",$$^%QZCHW("Note de presentation") S LNO=LNO+1
 I $$AIR^%QSGEST5(BASE,S,"PRESENTATION") S ORD=$$NXTRIAO^%QSTRUC8(BASE,S,"PRESENTATION",""),NOT=$$VALEUR^%QSTRUC8(BASE,S,"PRESENTATION",ORD) D IMPNOT(NOT,ORD,"    ")
 W !,! S LNO=LNO+2
 S ORD=""
BOUCORD S ORD=$$NXTRIAO^%QSTRUC8(BASE,S,"ATTRIBUT",ORD)
 G:ORD="" BOUCATF
 S V=$$VALEUR^%QSTRUC8(BASE,S,"ATTRIBUT",ORD)
 S ENSATT(ORD)=V
 G BOUCORD
BOUCATF S V=""
BIMPAT S V=$O(ENSATT(V))
 Q:V=""
 D IMPAT(V,ENSATT(V))
 G BIMPAT
 
IMPAT(IND,ATT) 
 W !,!,"  ",$$^%QZCHW("Attribut No")," ",IND," : ",ATT
 S LNO=LNO+2 D CONT
 W !,"    ",$$^%QZCHW("Numero d'ordre")
 S LNO=LNO+1 D CONT
 W !,"      ",$O(^[QUI]QUERY3(BASE,S,IND,"NUMERO.ORDRE",""))
 S LNO=LNO+1 D CONT
 W !,"    ",$$^%QZCHW("Valeur par defaut")
 S LNO=LNO+1 D CONT
 W !,"      ",$O(^[QUI]QUERY3(BASE,S,IND,"VALEUR.DEFAUT",""))
 S LNO=LNO+1 D CONT
 W !,"    ",$$^%QZCHW("Nombre de caracteres de la zone de saisie")
 S LNO=LNO+1 D CONT
 W !,"      ",$O(^[QUI]QUERY3(BASE,S,IND,"LONGUEUR",""))
 S LNO=LNO+1 D CONT
 W !,"    ",$$^%QZCHW("Valeurs legales ")
 S LNO=LNO+1 D CONT
 S LIND=$L(IND)+1,SINR=IND_","
 S INDDEF=SINR
BOUCDEF S INDDEF=$O(^[QUI]QUERY3(BASE,S,INDDEF))
 G:$E(INDDEF,1,LIND)'=SINR FBOUCDEF
 G:'($D(^[QUI]QUERY3(BASE,S,INDDEF,"VALEUR.LEGALE"))) BOUCDEF
 W !,"      ",$O(^[QUI]QUERY3(BASE,S,INDDEF,"VALEUR.LEGALE",""))
 S LNO=LNO+1 D CONT
 G BOUCDEF
FBOUCDEF W !,"    ",$$^%QZCHW("Note d'aide") S LNO=LNO+1 D CONT
 S ORD=$O(^[QUI]QUERY3(BASE,S,IND,"INDICE.NOTE",""))
 Q:ORD=""
 S NOT=$O(^[QUI]QUERY3(BASE,S,IND,"AIDE",""))
 D IMPNOT(NOT,ORD,"      ")
 Q
 
CONT D:LNO>(LMAX-5) TETE
 Q
 
TETE S PAGE=PAGE+1
 W #
 W !,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE,?40,$$^%QZCHW("Saisie : "),S
 W !,$$^%QZCHW("Page : "),PAGE,!,!
 S LNO=4 Q
 
IMPNOT(TITRE,ORD,VID) 
 N NLIG,%NLIG
 W !,VID,"    ",TITRE
 S LNO=LNO+1 D CONT
 Q:'($D(^[QUI]QUERYT(BASE,S,ORD)))
 S NLIG=""
 F %NLIG=0:0 S NLIG=$O(^[QUI]QUERYT(BASE,S,ORD,"LIGNE",NLIG)) Q:NLIG=""  W !,VID,^[QUI]QUERYT(BASE,S,ORD,"LIGNE",NLIG) S LNO=LNO+1 D CONT
 Q

