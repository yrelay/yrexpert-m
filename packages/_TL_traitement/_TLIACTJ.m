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

;%TLIACTJ^INT^1^59547,74029^0
TLIACTJ ;
 
COPIER 
 N VARTR,TYP,REPTR,NOM1,NOM2,REP,IND,ATT,ORD,KILL
 N WHOIS1,WHOIS2,REP1,IND1,IND2,QUI1,QUI2,OR2
 S KILL=MODEX'=1
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Copie d'un individu"))
 S TYP=$$RED($$RED(ACTI,1),"TEXTE")+0
 S VARTR=$$RED(ACTI,2)
 I TYP=1 S VARTR=$$RED(VARTR,"TEXTE") K CXT(VARTR) G REPCOP
 S POS=1,VARTR=$$SUBST^%ANARBR2(VARTR,.CXT,"ATT^%TLIACT3",.POS)
 I (VARTR="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer nom transformation")) S ECHEC=1 Q
REPCOP S POS=1,REP1=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS) I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer repertoire")) S ECHEC=1 Q
 S:REP1="" REP1=$$NOMLOG^%QSF(CXT("@","BASE"))
 S POS=1,IND1=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer nom individu"_$S(TYP=1:" a copier",1:""))) S ECHEC=1 Q
 S:IND1="" IND1=CXT("@","OBJET")
 S POS=1,IND2=$$SUBST^%ANARBR2($$RED(ACTI,5),.CXT,"ATT^%TLIACT3",.POS)
 I (IND2="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer nom "_$S(TYP=1:"individu a creer",1:"liste"))) S ECHEC=1 Q
 G:TYP=1 COPHIE
 
 N DEFR,DEFI,LISTE
 S DEFR=REP1,DEFI=IND1,LISTE=IND2
 I '($$DIAREC^%QMCPT(VARTR)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Copie non effectuee")) S ECHEC=1 Q
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Copie d'un individu terminee"))
 Q
 
COPHIE S POS=1,OR2=$$SUBST^%ANARBR2($$RED(ACTI,6),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer no ordre du fils")) S ECHEC=1 Q
 S POS=1,WHOIS2=$$SUBST^%ANARBR2($$RED(ACTI,7),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer nom service destination")) S ECHEC=1 Q
 S:WHOIS2="" WHOIS2=WHOIS
 I '($$DIACONT^%QMCPT) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Copie non effectuee")) S ECHEC=1 Q
 D:MODEX'=1 ^%QMCP9(WHOIS1,QUI1,BASE1,IND1,WHOIS2,QUI2,IND2,OR2)
 D:MODEX=2 STIND^%TLBAATT(BASE1,IND2,OR2,VARTR,"AJOUT")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARTR,IND2,1)
 S CXT(VARTR,"BASE")=BASE1,CXT(VARTR,"OBJET")=IND2
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Copie d'un individu terminee"))
 Q
 
 
ATTRIB 
 N REP,IND,ATTR,VAL,ORD
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Affectation d'un attribut"))
 S POS=1,REP=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer repertoire")) S ECHEC=1 Q
 S REP=$S(REP="":CXT("@","BASE"),1:$$NOMINT^%QSF(REP))
 I REP="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Repertoire inconnu")) S ECHEC=1 Q
 S POS=1,IND=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer individu")) S ECHEC=1 Q
 S:IND="" IND=CXT("@","OBJET")
 I '($$IR^%QSGE5(REP,IND)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Individu inexistant")) S ECHEC=1 Q
 S POS=1,ATTR=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I (ATTR="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Attribut inconnu")) S ECHEC=1 Q
 S POS=1,VAL=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(VAL="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Valeur inconnue ou egale a vide")) S ECHEC=1 Q
 S ORD=$$RED(ACTI,5)
 I ORD=0 S ORD=1 G ATTRIB2
 S POS=1,ORD=$$SUBST^%ANARBR2(ORD,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer No ordre")) S ECHEC=1 Q
ATTRIB2 D AFFAT^%TLIACTS(REP,IND,ATTR,VAL,ORD)
 D:MODAF ADD^%TLIFEN("LOG","  Affectation terminee")
 Q
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

