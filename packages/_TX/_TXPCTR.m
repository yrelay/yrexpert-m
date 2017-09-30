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

;%TXPCTR^INT^1^59547,74032^0
%TXPCTR(ARB,NOEUD) ;;05:39 PM  19 Mar 1993; ; 10 Mar 93  9:21 AM
 
 
 
 N %iet,%ieta,%V,%PERARB,TYPE,NVLIB
 
 N %VMIN,%QTT,etat
 S %VMIN=VLIMI
 S PMAX=$$^%TXPMAX(ATELIER),TMAX=$$PULLVAL^%TXPPRIM(ARB,NOEUD,"PERARB",1)
 ;; contrainte globale de production
 S TYPE=$$PULLVAL^%TXPPRIM(ARB,NOEUD,"TYPE",1) I TYPE=1 S %VMIN=$$PULLVAL^%TXPPRIM(ARB,NOEUD,"VALEUR.DE.CONTRAINTE",1),%PERARB=$$PULLVAL^%TXPPRIM(ARB,NOEUD,"PERIODE.A.ARBITRER",1) G SUITE
 S CONTRAINTE=$O(@etuatcg@("")) I CONTRAINTE="" G SUITE
 S etat=@etuatc@("Etat de cette contrainte") I etat'="Active" W !,"contrainte ",CONTRAINTE," non active " G SUITE
 
 
 F %iet=1:1:PMAX S NVLIB=$$PULLVAL^%TXPPRIM(ARB,NOEUD,"NOMBRE.DE.VARIABLES.LIBRES",%iet) I NVLIB>0 S %V=@etuatc@("Periode "_%iet) W:VISU>1 !,!," sommation de la contrainte ",CONTRAINTE," ",%V,! D somart,PUSHVAL^%TXPPRIM(ARB,NOEUD,"V",%iet,%V) I %V<%VMIN S %VMIN=%V,%PERARB=%iet
 
SUITE 
 
 
 D PUSHVAL^%TXPPRIM(ARB,NOEUD,"VALEUR.DE.CONTRAINTE",1,%VMIN)
 I %VMIN'<0 D PUSHVAL^%TXPPRIM(ARB,NOEUD,"OPTIMUM",1,"OUI") S @ARB@("OPTIMUM")=NOEUD,@etuat@("OPTIMUM")=$$PULLVAL^%TXPPRIM(ARB,NOEUD,"VALEUR",1)_"   "_NOEUD Q
 
 
 
 
 
 
 
 
 S ARTICLE="",%ieta=1,%QUANTITE=-(VLIMI),%ARTARB=""
 D listfix
SUITE2 S ARTICLE=$O(@etuatag@(ARTICLE)) G:ARTICLE="" SUIT20
 
 I '($$BELOLISTE^%TXPPRIM(ARB,NOEUD,"VARIABLES.FIXEES",%PERARB_"|"_ARTICLE)) S %QTT=$$PULLMAT^%TXPPRIM(ARB,NOEUD,"Q",%PERARB,ARTICLE) I %QTT>%QUANTITE S %ARTARB=ARTICLE,%QUANTITE=%QTT
 S %ieta=%ieta+1
 G SUITE2
SUIT20 
 I (%QUANTITE=(-(VLIMI)))!(%ARTARB="") D PUSHVAL^%TXPPRIM(ARB,NOEUD,"IRREALISABLE",1,"OUI") Q
 
fin D PUSHVAL^%TXPPRIM(ARB,NOEUD,"PERIODE.A.ARBITRER",1,%PERARB)
 D PUSHVAL^%TXPPRIM(ARB,NOEUD,"ARTICLE.A.ARBITRER",1,%ARTARB),PUSHVAL^%TXPPRIM(ARB,NOEUD,"OPTIMUM",1,"NON"),PUSHVAL^%TXPPRIM(ARB,NOEUD,"IRREALISABLE",1,"NON"),PUSHVAL^%TXPPRIM(ARB,NOEUD,"QUANTITE.A.ARBITRER",1,%QUANTITE)
 I VISU#2 U printer W !,!,">>>>> SEPARER le NOEUD ",NOEUD," sur ",%PERARB," ",%ARTARB," ",%QUANTITE
 I VISU>1,printer=0 U 0 R %xx
 Q
 
somart 
 S ARTICLE="" F %ieta=1:1 S ARTICLE=$O(@etuatag@(ARTICLE)) Q:ARTICLE=""  S qmh=@etuata@("Quantite moyenne horaire"),qmh1=1/qmh,%V=%V-($$PULLMAT^%TXPPRIM(ARB,NOEUD,"Q",%iet,ARTICLE)*qmh1),%V=$J(%V," ",2)
 I VISU>1 W ?30,"*** valeur ***",%V
 Q
listfix 
 N %ieta
 F %ieta=1:1:PMAX S ARTICLE="" D list
 Q
list 
 S ARTICLE=$O(@etuatag@(ARTICLE)) Q:ARTICLE=""
 I $$BELOLISTE^%TXPPRIM(ARB,NOEUD,"VARIABLES.FIXEES",%ieta_"|"_ARTICLE),VISU#2 W !,"*** fixee ***",%ieta," ",ARTICLE
 G list

