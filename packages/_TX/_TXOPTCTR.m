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

;%TXOPTCTR^INT^1^59547,74031^0
%TXOPTCTR(ARB,NOEUD) ;;05:13 AM  18 Jun 1992; ; 24 May 92 12:49 PM
 
 
 
 N %iet,%ieta,%V,%VMIN,%PERARB,TYPE
 
 
 S %VMIN=30000000,VISU=0
 S PMAX=@etu@("Nombre de Periodes"),TMAX=$$PULLVAL^%TXOPTPRIM(ARB,NOEUD,"PERARB",1)
 ;; contrainte globale de production
 S TYPE=$$PULLVAL^%TXOPTPRIM(ARB,NOEUD,"TYPE",1) I TYPE=1 S %VMIN=$$PULLVAL^%TXOPTPRIM(ARB,NOEUD,"VALEUR.DE.CONTRAINTE",1),%PERARB=$$PULLVAL^%TXOPTPRIM(ARB,NOEUD,"PERIODE.A.ARBITRER",1) G SUITE
 S CONTRAINTE=$O(@etuatcg@("")) I CONTRAINTE="" G SUITE
 F %iet=1:1:PMAX S %V=@etuatc@("Periode "_%iet) W:VISU !,!," sommation de la contrainte ",CONTRAINTE," ",%V,! D somart,PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"V",%iet,%V) I %V<%VMIN S %VMIN=%V,%PERARB=%iet
SUITE 
 
 D PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"VALEUR.DE.CONTRAINTE",1,%VMIN)
 I %VMIN'<0 D PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"OPTIMUM",1,"OUI") S @ARB@("OPTIMUM")=NOEUD,@etu@("OPTIMUM")=$$PULLVAL^%TXOPTPRIM(ARB,NOEUD,"VALEUR",1)_"   "_NOEUD W *7,*7,*7 Q
 
 
 
 
 
 
 S ARTICLE="" F %ieta=1:1 S ARTICLE=$O(@etuatag@(ARTICLE)) Q:ARTICLE=""  I ('($$BELOLISTE^%TXOPTPRIM(ARB,NOEUD,"VARIABLES.FIXEES",%PERARB_"|"_ARTICLE)))&($$PULLMAT^%TXOPTPRIM(ARB,NOEUD,"Q",%PERARB,ARTICLE)>0) S %ARTARB=ARTICLE,%QUANTITE=$$PULLMAT^%TXOPTPRIM(ARB,NOEUD,"Q",%PERARB,ARTICLE) G fin
 
 D PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"IRREALISABLE",1,"OUI") Q
 
fin D PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"PERIODE.A.ARBITRER",1,%PERARB)
 D PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"ARTICLE.A.ARBITRER",1,%ARTARB),PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"OPTIMUM",1,"NON"),PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"IRREALISABLE",1,"NON"),PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"QUANTITE.A.ARBITRER",1,%QUANTITE)
 Q
 
somart 
 S ARTICLE="" F %ieta=1:1 S ARTICLE=$O(@etuatag@(ARTICLE)) Q:ARTICLE=""  S qmh=@etuata@("Quantite moyenne horaire"),qmh1=1/qmh,%V=%V-($$PULLMAT^%TXOPTPRIM(ARB,NOEUD,"Q",%iet,ARTICLE)*qmh1)
 Q

