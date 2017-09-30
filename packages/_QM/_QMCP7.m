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

;%QMCP7^INT^1^59547,73876^0
QMCP7 ;
 
 
 
 
 N TEMP,AIDE,I
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S AIDE=$$CONCAS^%QZCHAD(TEMP,"AIDE")
 F I=0:1 S A=$P($T(HELP+I),";;",2) Q:A="$"  S @AIDE@(I)=A
 D REAFF^%QULIMO3(1,1,AIDE,XG,YH,DH,DV)
 D VISU^%QULIMO(XG,YH,DH,DV,AIDE,1)
 K @(TEMP)
 Q
HELP ;;
 ;;vous allez definir la correspondance de deux schemas de donnees
 ;;afin d'effectuer la copie d'une liste d'individus
 ;;pour cela il faut definir :
 ;;
 ;;a) definition minimum
 ;;
 ;;1) un service origine (SO) et un service destination (SD) par 
 ;;SERVICE # SO -> SD
 ;;si vous ne souhaitez ne pas changer de service
 ;;SERVICE # SO 
 ;;
 ;;2) le repertoire origine des individus RO et destination RD
 ;;REPERTOIRE # RO -> RD
 ;;si vous ne souhaitez faire une copie intra repertoire
 ;;REPERTOIRE # RO 
 ;;
 ;;3) la correspondance des liens a parcourir pour copier les individus
 ;;lies aux individus de base du repertoire RO
 ;;LIEN # LIENO1 -> LIENR1
 ;;LIEN # LIENO2 -> LIENR2
 ;;et si vous ne souhaitez ne pas renommer un lien mais le parcourir
 ;;LIEN # LIENO3
 ;;
 ;;b)options
 ;;
 ;;Vous pouvez egalement specifier une liste d'attributs LISTA 
 ;;par repertoire R afin de ne copier que ces attributs pour les 
 ;;individus du repertoire R
 ;;LISTE.D.ATTRIBUTS # R -> LISTA
 ;;
 ;;Si vous souhaitez detruire les individus qui se trouveraient avoir
 ;;le meme nom que les individus resultats de la copie
 ;;DESTRUCTION # OUI
 ;;sinon
 ;;DESTRUCTION # NON
 ;;l'option par defaut etant OUI
 ;;
 ;;Si vous souhaitez verifier si votre copie va ecraser des individus
 ;;et le cas echeant ne pas effectuer la copie et avoir un compte-rendu
 ;;des individus qui vont etre ecrases
 ;;
 ;;VERIFICATION # OUI
 ;;sinon
 ;;VERIFICATION # NON
 ;;l'option par defaut etant OUI
 ;;
 ;;c) exemple
 ;;Par exemple si vous devez copier une gamme d'un service SVE1
 ;;avec un repertoire des gammes egal a GAMME
 ;;un lien vers les operations OPERATION.DE.MA.GAMME
 ;;vers un service SVE2
 ;;avec un repertoire des gammes GAMME.EN.FABRICATION
 ;;et un lien vers les operations OPERATION.EN.FABRICATION
 ;;on obtient la definition suivante
 ;;
 ;;SERVICE # SVE1 -> SVE2
 ;;REPERTOIRE # GAMME -> GAMME.EN.FABRICATION
 ;;LIEN # OPERATION.DE.MA.GAMME -> OPERATION.EN.FABRICATION
 ;;LISTE.D.ATTRIBUTS # OPERATION -> ATTRIBUTS.DE.MES.OPERATIONS
 ;;
 ;;Si vous souhaitez renommer les individus copies il faut creer
 ;;un individu dit de definition dans un repertoire dit de definition 
 ;;dont les attributs definiront le renommage de la facon suivante :
 ;;
 ;;COPIE.repertoiresource(vieux nom)=futur nom
 ;;
 ;;ce qui donne ici
 ;;COPIE.GAMME("vielle gamme")=future gamme
 ;;et
 ;;COPIE.OPERATION("vielle operation")=future operation
 ;;
 ;;vous venez donc de definir la copie d'une liste d'individus
 ;;d'un utilisateur SV1 vers un autre SV2
 ;;   (si SV1=SV2 c'est une copie intra utilisateur)
 ;;d'un repertoire vers un autre
 ;;   (si les repertoires sont identiques c'est une copie 
 ;;                                              intra repertoire)
 ;;en indiquant les liens a parcourir pour obtenir les individus lies
 ;;a copier 
 ;;Cette definition indique aussi la facon dont les liens et donc les
 ;;repertoires se correspondent.
 ;;si vous avez defini un renommage des liens alors la copie est inter
 ;;repertoire
 ;;
 ;;il ne vous reste plus qu'a creer l'individu de definition
 ;;si vous souhaitez renommer les individus
 ;;puis creer une liste des individus du repertoire de depart a copier
 ;;et activer la copie
 ;;$

