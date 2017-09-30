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

;TOP0HAUD^INT^1^59547,74873^0
TOP0HAUD ;
PARQU ;;CODE.HABILLAGE~CRT~CLIENT.A.FACTURER~ADRESSE.FACTURATION
 ;;VILLE.PAYS.FACTURATION~CLIENT.A.LIVRER~ADRESSE.LIVRAISON
 ;;VILLE.PAYS.LIVRAISON~FAMILLE~POIDS.COMMANDE~POIDS.MAXIMAL
 ;;POIDS.MINIMAL~QUANTITE~QUANTITE.MAXIMAL~QUANTITE.MINIMAL
 ;;ORGANISME.DE.RECEPTION~REFERENCE.COMMANDE.CLIENT~DOCUMENT
 ;;1~14~20~14~1~~~P~TYPE.SCIAGE~^PARPARTI(DOLARI)
PARAM ;;1~2~7~14~1~N~~P~ALLIAGE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~2~23~14~1~N~~P~ALLIAGE.FABRIQUE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~2~33~6~1~~~P~ETAT~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~2~41~10~1~~~P~ETAT.REALISE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~4~2~5~1~2~~P~EPAISSEUR.COMMANDEE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~4~9~6~1~1~~P~LARGEUR.COMMANDEE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~4~17~7~1~1~~P~LONGUEUR.COMMANDEE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~4~26~6~1~~~P~EPAISSEUR.TOLE.BRUTE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~4~33~5~1~N~~P~POIDS.TOLE.BRUTE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~6~2~5~1~2~~P~EPAISSEUR.MAXI~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~6~9~6~1~1~~P~LARGEUR.MAXI~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~6~17~7~1~1~~P~LONGUEUR.MAXI~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~6~26~6~1~N~~P~POIDS.TOLE.FINIE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~6~33~5~1~N~~P~NOMBRE.TOLE.PREVU~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~8~2~5~1~2~~P~EPAISSEUR.MINI~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~8~9~6~1~1~~P~LARGEUR.MINI~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~8~17~7~1~1~~P~LONGUEUR.MINI~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~8~26~8~1~N~~P~POIDS.COLIS~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~10~2~5~1~2~~P~EPAISSEUR.FINIE.VISEE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~10~9~6~1~1~~P~LARGEUR.VISEE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~10~17~7~1~1~~P~LONGUEUR.VISEE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~10~26~6~1~N~~P~CODE.COLIS.RETENU~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~10~33~5~1~N~~P~CODE.HABILLAGE~^PARPARTI(DOLARI)
 ;;1~14~5~4~1~N~~P~QUALITE.FONDERIE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~14~8~2~1~N~~P~MATIERE~^PARPARTI(DOLARI)
 ;;1~14~12~5~1~N~~P~LONGUEUR.UTILE.DU.PLATEAU~^[QUI]PARMAT(NUFA,TWREF)
 ;;1~14~20~14~1~~~P~EXTREMITES.PLATEAU~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~14~35~4~1~N~~P~SCALPAGE~^[QUI]PARMAT(NUFA,TWREF)
 ;;1~16~1~4~1~N~~P~NOMBRE.DE.TOLES.EN.LARGEUR~^[QUI]PARMAT(NUFA,TWREF)
 ;;1~16~6~4~1~N~~P~NOMBRE.EBAUCHE.TRACTIONNABLE~^[QUI]PARMAT(NUFA,TWREF)
 ;;1~16~12~4~1~N~~P~NOMBRE.DE.TOLES.EN.LARGEUR~^[QUI]PARMAT(NUFA,TWREF)
 ;;1~16~17~4~1~N~~P~NOMBRE.DE.TOLES.EN.LONGUEUR~^[QUI]PARMAT(NUFA,TWREF)
 ;;1~12~12~4~1~N~~P~CODE.NORME.AC~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~12~17~4~1~N~~P~CODE.NORME.AUTRE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~12~22~4~1~N~~P~CODE.NORME.PLANEITE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~12~27~5~1~N~~P~CODE.NORME.CLASSE.US~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~12~32~4~1~N~~P~ORIGINE.TOLERANCE.DIMENTIONNELLE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~2~0~6~1~~~P~CRT~^PARPARTI(DOLARI)
 ;;1~2~64~5~1~~~P~NUMERO.COMMANDE~^PARPARTI(DOLARI)
 ;;1~2~72~3~1~N~~P~POSTE~^PARPARTI(DOLARI)
 ;;1~3~41~29~1~~~P~CLIENT.A.FACTURER~^PARPARTI(DOLARI)
 ;;1~4~41~29~1~~~P~ADRESSE.FACTURATION~^PARPARTI(DOLARI)
 ;;1~5~41~29~1~~~P~VILLE.PAYS.FACTURATION~^PARPARTI(DOLARI)
 ;;1~6~41~29~1~~~P~CLIENT.A.LIVRER~^PARPARTI(DOLARI)
 ;;1~7~41~29~1~~~P~ADRESSE.LIVRAISON~^PARPARTI(DOLARI)
 ;;1~8~41~29~1~~~P~VILLE.PAYS.LIVRAISON~^PARPARTI(DOLARI)
 ;;1~4~69~4~1~N~~P~DATE.AU.PLUS.TOT~^PARPARTI(DOLARI)
 ;;1~4~74~4~1~N~~P~DATE.AU.PLUS.TARD~^PARPARTI(DOLARI)
 ;;1~6~69~6~1~N~~P~FAMILLE~^PARPARTI(DOLARI)
 ;;1~6~74~6~1~N~~P~PHE~^PARPARTI(DOLARI)
 ;;1~8~69~6~1~N~~P~L204.SEMAINE~^[QUI]TVPAR(NUFA,TWREF)
 ;;1~10~42~4~1~0~~P~POIDS.COMMANDE~^PARPARTI(DOLARI)
 ;;1~10~48~4~1~0~~P~POIDS.MAXIMAL~^PARPARTI(DOLARI)
 ;;1~10~55~4~1~0~~P~POIDS.MINIMAL~^PARPARTI(DOLARI)
 ;;1~12~42~4~1~N~~P~QUANTITE~^PARPARTI(DOLARI)
 ;;1~12~48~4~1~0~~P~QUANTITE.MAXIMALE~^PARPARTI(DOLARI)
 ;;1~12~55~4~1~0~~P~QUANTITE.MINIMALE~^PARPARTI(DOLARI)
 ;;1~12~6~6~1~~~P~DOCUMENT~^PARPARTI(DOLARI)
 ;;1~12~1~4~1~~~P~ORGANISME.DE.RECEPTION~^PARPARTI(DOLARI)
 ;;1~14~41~11~2~~~P~REFERENCE.COMMANDE.CLIENT~^PARPARTI(DOLARI)
 ;;1~18~0~37~4~~~P~INSTRUCTIONS.PARTICULIERES~^[QUI]TVPAR(NUFA,TWREF)

