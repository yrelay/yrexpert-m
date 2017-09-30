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

;%QSVAREX^INT^1^59547,73883^0
%QSVAREX ;;02:36 PM  7 May 1992
PR(BASE,OBJET,ATT,VAL,ORD,TYPE,MAJ,ANCVAL) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S MAJ="VRAI"
 
 Q:'($D(^[QUI]QSVARAT("AVANT",TYPE,BASE,ATT)))
 N NIV,VA,T,L,EXP
 
 D EMPILE
 
 S VA="",T="AVANT"
LOPPR S VA=$O(^[QUI]QSVARAT("AVANT",TYPE,BASE,ATT,VA))
 G:VA="" FINPR
 D EXECUT
 G LOPPR
 
FINPR S MAJ=^PILMOTRE($J,NIV,"$MAJ.BASE")
 D DEPILE
 Q
 
EP(BASE,OBJET,ATT,ORD,TYPE,ANCVAL) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 Q:'($D(^[QUI]QSVARAT("APRES",TYPE,BASE,ATT)))
 N NIV,T,VA,L,EXP,VAL
 S VAL=$$^%QSCALIN(BASE,OBJET,ATT,ORD)
 D EMPILE
 
 S VA="",T="APRES"
LOPEP S VA=$O(^[QUI]QSVARAT("APRES",TYPE,BASE,ATT,VA))
 G:VA="" FINEP
 D EXECUT
 G LOPEP
 
FINEP D DEPILE
 Q
 
 
EMPILE 
 
 I '($D(^PILMOTRE($J))) S ^PILMOTRE($J)=0
 S (NIV,^PILMOTRE($J))=^PILMOTRE($J)+1
 S ^PILMOTRE($J,NIV,"$REPERTOIRE")=$$NOMLOG^%QSF(BASE)
 S ^PILMOTRE($J,NIV,"$INDIVIDU")=OBJET
 S ^PILMOTRE($J,NIV,"$ATTRIBUT")=ATT
 S ^PILMOTRE($J,NIV,"$TYPE.MAJ")=TYPE
 S ^PILMOTRE($J,NIV,"$NOUVELLE.VALEUR")=VAL
 S ^PILMOTRE($J,NIV,"$ANCIENNE.VALEUR")=ANCVAL
 
 S ^PILMOTRE($J,NIV,"$UTILISATEUR")=WHOIS
 S ^PILMOTRE($J,NIV,"$MAJ.BASE")="VRAI"
 Q
 
DEPILE 
 S NIV=^PILMOTRE($J)
 K ^PILMOTRE($J,NIV)
 S ^PILMOTRE($J)=^PILMOTRE($J)-1
 I ^PILMOTRE($J)=0 K ^PILMOTRE($J)
 Q
 
ERR Q
 
EXECUT 
 
 
 
 
 
 
 
 
 
 
 
 
 N INIV,CALL
 N ABANDON,GLOSTO,CXT,ORIGINE,ORIG,REP,IND,ETIQ,RETOURGO,MODAF,MODEX,HALT
 S CALL=T_"^"_VA_"^"_TYPE_"^"_BASE_"^"_OBJET
 
 
 S INIV=0
EXEBCL S INIV=$O(^PILMOTRE($J,INIV)) G:INIV=NIV EXESIT
 Q:^PILMOTRE($J,INIV,"ACTIVATION")=CALL
 G EXEBCL
EXESIT 
 S L="",EXP=1
 S L=$O(^[QUI]QSVARACT(T,VA,"SITUATIONS","COMP",L))
 
EVSIT 
 I (L="")!(EXP=0) G FINSIT
 S EXP=0 X ^[QUI]QSVARACT(T,VA,"SITUATIONS","COMP",L)
 S L=$O(^[QUI]QSVARACT(T,VA,"SITUATIONS","COMP",L))
 G EVSIT
FINSIT I EXP=0 Q
 
 
 
 
 
 
 
 S ^PILMOTRE($J,NIV,"ACTIVATION")=CALL
 
 
 D REMCTR^%SYSCLAV
 I '($D(KVARLOC)) N KVARLOC S KVARLOC=2
 S ABANDON=0,ORIG="VARACT",HALT=0
 
 
 D:KVARLOC=2 KVARLOC^%TLIACTI
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 S CXT("@","BASE")=BASE,CXT("@","OBJET")=OBJET
 S ORIGINE="QSVA"
 S GLOSTO="^[QUI]QSVARACT("""_T_""","""_VA_""",""ACTIONS"")"
 S REP=BASE,IND=OBJET,ETIQ=""
 D INIT^%ANGEPIL
 S MODAF=0,MODEX=0
 S RETOURGO="RETVAR^%QSVAREX" G GO^%TLIACT1
RETVAR D EPIL^%ANGEPIL
 D:KVARLOC=2 KVARLOC^%TLIACTI
 Q

