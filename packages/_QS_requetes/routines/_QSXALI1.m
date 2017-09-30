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

;%QSXALI1^INT^1^59547,73883^0
QSXALI1 ;
 
 
 
OARC() N REQUETE,REP,LCRIT,ANLYSE,ER,LISTE
 S REQUETE="VIEUX ARCS"
 S REP="P0"
 S LCRIT(1)="'$EXISTE(DATE.RECUPERATION.SDB)"
 S LCRIT(1,"TETE")=0
 Q $$CREER(REQUETE,REP,.LIND,.LCRIT,.LVAR)
 
CREER(REQUETE,REP,LIND,LCRIT,LVAR) 
 N LISTE
 I $$EXISTE^%QSINTER(REQUETE) D SUPPRIME^%QSINTER(REQUETE,1)
 S ER=$$CREER^%QSINTER(REQUETE,REP,.LIND,.LCRIT,.LVAR,"",1)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Activation de ")_REQUETE
 S LISTE=$$ACTIVE^%QSINTER(REQUETE,"")
 Q LISTE
 
VEXP() N REQUETE,REP,LCRIT,ANLYSE,ER,LISTE
 S REQUETE="VIELLES EXPEDITIONS"
 S REP="EXPEDITION"
 S LCRIT(1)="'$EXISTE(ARC)"
 S LCRIT(1,"TETE")=0
 Q $$CREER(REQUETE,REP,.LIND,.LCRIT,.LVAR)
TOTEX 
 N LISTE,STO,TEMP,LOC
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LOC=$$CONCAS^%QZCHAD(TEMP,"INDIV.TRAITES")
 S LISTE=$$VEXP
 S STO=$$ADRLIS^%QSGEST7(LISTE)
 S ^%QSXALI1("LOC")=LOC
 S ^%QSXALI1("BASE")="EXPEDITION"
 S ^%QSXALI1("LISTE")=STO
 ZJ EXPE^%QSXALI1
 K @(TEMP)
 Q
 
GARBA X ^BTL D TOTAL^%ANGARBA Q
 
LISTE X ^BTL D JTESTB^%QSXSTO Q
 
EXPE X ^BTL
 S LOC=^%QSXALI1("LOC")
 S BASE=^%QSXALI1("BASE")
 S LISTE=^%QSXALI1("LISTE")
 D ^%QSXKILL(LOC,BASE,LISTE)
 Q
 
DEBUT X ^BTL
 ZJ DEB1^%QSXALI1
 Q
 
DEB1 X ^BTL
 D GARBA^%QSXALI1
 D LISTE^%QSXALI1
 D PP2^%QSXALI1
 D PP1^%QSXALI1
 D OEX^%QSXALI1
 D KILLMEM^%QSETINI
 Q
PP2 
 X ^BTL
 N STO,LISTE,BASE,LIEN
 S LISTE="^[QUI]QUERY1(""P2"")"
 S BASE="P2"
 S LIEN="ARC"
 S STO="^%QSXE"
 S DEL=$$CONCAS^%QZCHAD(STO,BASE_",DATA")
 D ^%QSXE(STO,LISTE,BASE,LIEN)
 W "je tue les composants orphelins ",$$^%QCAZG(DEL)
 D ^%QSXKILL($$CONCAS^%QZCHAD("^%QSXKILL",BASE),BASE,DEL)
 K @(STO)
 Q
PP1 
 X ^BTL
 N STO,LISTE,BASE,LIEN
 S STO=$$CONCAS^%QZCHAD("^%QSXE",BASE)
 S LISTE="^[QUI]QUERY1(""P1"")"
 S BASE="P1"
 S STO="^%QSXE"
 S LIEN="COMPOSANT"
 S DEL=$$CONCAS^%QZCHAD(STO,BASE_",DATA")
 D ^%QSXE(STO,LISTE,BASE,LIEN)
 W "je tue les operations orphelines ",$$^%QCAZG(DEL)
 D ^%QSXKILL($$CONCAS^%QZCHAD("^%QSXKILL",BASE),BASE,DEL)
 K @(STO)
 Q
 
OEX 
 N I,J,A
 F I="ER0","ER1" F J=1:1:4 S A=$$CONCAS^%QZCHAD("^[QUI]QUERY"_J,I) W !,A K @(A)
 
 K ^[QUI]TOP0XGET
 K ^[QUI]TOP0XAVE
 K ^[QUI]TOP0XERL
 K ^[QUI]PSRLAVEX
 K ^[QUI]TOP0EXVU
 K ^[QUI]TOP0XANO
 K ^[QUI]TOP0XSAV
 Q

