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

;%TXOPTSW2^INT^1^59547,74032^0
%TXOPTSW2 ;
 
 N NBC,v,i,VAR,GLO,GSUIV,VAL,VALCON,NBFIX
 S STO="STOCON",VAL="VALCON",NBC=8
 S NBC=NBC+1,NBFIX=2 ;;le nom de l'etude est un parametre
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"G")
 S GSUIV=etuat
 D INICONF S ABAND="N"
 D INIT^%TXOPTSW1
 
 S J=1 F i=1:1:NBC S VALCON(J)=@GSUIV@(VAR(i)),J=J+1
 S VALCON="STOCON"
 S @GLO=$P($T(TITRE+1),";;",2)
 D DEF^%TXOPTSW1
 K @(GLO) Q
INICONF 
 
INIVAR 
 F i=1:1:NBC S v=$P($T(VAR+i),";;",2),v1=$P(v,"~",1),v2=$P(v,"~",2),VAR(i)=v1 S:v2["$$" @("v2="_v2) S:'($D(@GSUIV@(VAR(i)))) @GSUIV@(VAR(i))=v2
 Q
etude() Q ETUDE
atelier() Q ATELIER
VAR 
 ;;Etude~$$etude
 ;;Atelier~$$atelier
 ;;Commentaire~atelier standard
 ;;Cout de lancement~150
 ;;Cout de l'heure de production Normale~179
 ;;Cout de l'heure de production Exceptionnelle~250
 ;;     ~     
 ;;Etude Atelier~Non encore activee
 ;;Valeur Atelier~3000000000 
 
TITRE ;;
 ;;Description de l'atelier
INIV(NBC,GSUIV) 
 F i=1:1:NBC S v=$P($T(VAR+i),";;",2),v1=$P(v,"~",1),v2=$P(v,"~",2),VAR(i)=v1 S:v2["$$" @("v2="_v2) S:'($D(@GSUIV@(VAR(i)))) @GSUIV@(VAR(i))=v2
 Q

