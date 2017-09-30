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

;%TLFEXT^INT^1^59547,74029^0
%TLFEXT ;
 
 
STD K ^TTLEXTER
 S ^TTLEXTER("ANNONCE")="^GPTRTAN|1|EXPR"
 S ^TTLEXTER("CUMUL.AVEX")="^%TLTXAV|2|EXPR/EXPR"
 S ^TTLEXTER("COPIER.INDIVIDU")="^%QSCOPOB|5|EXPR/EXPR"
 S ^TTLEXTER("DETRUIRE.GAMME")="INT^%MZQKG|0"
 S ^TTLEXTER("DIALOGUE")="^%TLTRDIA|2|EXPR/EXPR"
 S ^TTLEXTER("DEVELOPPEE.EMBOUTISSAGE")="^%EMTLFEX|1|EXPR"
 S ^TTLEXTER("EN.TETE.MOZART")="^%MZFEXT|2|EXPR/EXPR"
 
 S ^TTLEXTER("IMPRESSION.DE.GAMMES")="^%MZPRINT|0"
 S ^TTLEXTER("INCREMENTER.NUMERO")="NFONC^%QCAPOP|2|EXPR/EXPR"
 
 S ^TTLEXTER("MODIFICATION.SYNONYME")="^%QAXMOD|2|EXPR/EXPR"
 S ^TTLEXTER("PORT")="^PRT2|6|EXPR/EXPR/EXPR/EXPR/EXPR/EXPR"
 S ^TTLEXTER("SQUEAK")="^%VSQUEAK|0"
 S ^TTLEXTER("SYNONYME")="CLEPAG^%VVIDEO,^%VCMS(""ZSYNONY"")|0"
 S ^TTLEXTER("LIEN.VERS.GLOBAL")="FEXTER^%QULARG|5|EXPR/EXPR/EXPR/EXPR/EXPR"
 S ^TTLEXTER("QARBRE")="^%QARBRE|6|EXPR/EXPR/EXPR/EXPR/ADR/ADR"
 S ^TTLEXTER("DEC")="^xutdvt|7|EXPR/EXPR/ADR/ADR/ADR/ADR/ADR"
 S ^TTLEXTER("PARCOURS.LIEN")="FEXTER^%QULARB|9|EXPR/EXPR/EXPR/EXPR/EXPR/ADR/ADR/ADR/ADR"
 
 S ^TTLEXTER("TXP.SAISIE.DEMANDE")="DEM^%TXPKSTD|2|EXPR/EXPR"
 S ^TTLEXTER("TXP.SAISIE.CONTRAINTE.STOCK")="UNCSTO^%TXPKSCK|2|EXPR/EXPR"
 S ^TTLEXTER("TXP.SAISIE.CONTRAINTE.PRODUCTION")="UNCPROD^%TXPKSCK|2|EXPR/EXPR"
 S ^TTLEXTER("TXP.SAISIE.CAPACITE")="CONTATE^%TXPKSCK|2|EXPR/EXPR"
 
 S ^TTLEXTER("SAISIR.ATTRIBUT.MULTIVALUE")="SAISIE^%SRBATT1|10|EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR"
 S ^TTLEXTER("SAISIR.DEUX.ATTRIBUTS.MULTIVALUES")="OLD^%SRBATT2|11|EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR"
 S ^TTLEXTER("PASSERELLE.DELINS")="ACTIVE^LKPLSD|2|EXPR/ADR"
 S ^TTLEXTER("PASSERELLE.MOUVEMENT")="ACTIVE^LKPLSM|1|EXPR/EXPR"
 S ^TTLEXTER("PROPAGATION")="MVT^LKPLSGM|3|EXPR/EXPR/EXPR"
 S ^TTLEXTER("IMPLANTATION")="^%TXQFEXT|0|"
 
 
 
 S ^TTLEXTER("AFFICHAGE.TYPE.TUYERE")="^%TLTXSN|1|EXPR"
 
 S ^TTLEXTER("CIAT.PASSERELLE.AJOUT")="^PSRCIATA|0"
 S ^TTLEXTER("CIAT.PASSERELLE.MODIF")="^PSRCIATM|0"
 S ^TTLEXTER("CIAT.PASSERELLE.SUPPRESSION")="^PSRCIATS|0"
 
 
 S ^TTLEXTER("GDT")="^UTDGFT|5|EXPR/EXPR/EXPR/EXPR/EXPR"
 
 S ^TTLEXTER("RESULTAT.TEST.REQUETE")="^%QSTSTEC|5|EXPR/EXPR/EXPR/EXPR/EXPR"
 Q
 
MENU(W) 
 N CONT,EX,I,OPT
 S CONT=$P($T(@W),";;",2) Q:CONT=""
 F I=1:1 S EX=$P(CONT,"/",I) Q:EX=""  S OPT=$P(EX,",",1),^TTLEXTER("MENU",OPT)=$P(EX,",",2)
 Q
CBL ;;CONTRATS,^GCMDRIV8/VISAS,^GCMDRIV9/CLIENTS,^GCMDRIV3/ARTICLES,^GCMDRIV4/PREVISIONS,^GCMDRIV6/BUDGETS,^GCMDRIV9/GESTION DES REPERTOIRES,^%QSMINI

