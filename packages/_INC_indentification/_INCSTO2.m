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

;%INCSTO2^INT^1^59547,73870^0
ZSTABID ;
 
 
 N ADR
 S ADR="^TABIDENT"
 I RESUL(1)="" Q
 S RF=@ADR@(RESUL(1)) K @ADR@(RESUL(1)) S @ADR@(RESUL(1))=RF
 S WHO=RESUL(1),NUR=0
 F IT="WHOIS","BACK","ENTETE","MACHINE","NOM","PASS","PRINTER","IMPRCOUR","SITE","START","TABTRA","TYPTAB","ECRGRA","TYPECR" S NUR=NUR+1 I $D(RESUL(NUR)),RESUL(NUR)'="" S @ADR@(WHO,IT)=RESUL(NUR)
 I $D(RESUL(25)) S @ADR@(WHO,"ORDINATEUR")=RESUL(25)
 I $D(RESUL(26)) S @ADR@(WHO,"LANGAGE")=RESUL(26)
 S:RESUL(24)'="" @ADR@(WHO,"EXIMOZ")=RESUL(24)
 K @ADR@(WHOIS,"INTERDIT")
 S INT="MOD" F NUR=15:1:17 D TRAIT
 S INT="COMP" F NUR=18:1:20 D TRAIT
 S INT="EXEC" F NUR=21:1:23 D TRAIT
TMOZ S RG="" F %U=0:0 S RG=$O(^TABIDMOZ(RESUL(1),RG)) Q:RG=""  D TMOZ1(RESUL(1),RG)
FIN K IT,NUR,INT,WHO,DEV,DEVI Q
TMOZ1(A,B) 
 N ADR
 S ADR="^TABIDENT"
 S RF=^TABIDMOZ(A,B),@ADR@(A,"MOZART",B,"GE")=B,@ADR@(A,"MOZART",B,"OE")=$P(RF,"^",1)
 Q
MOZ D TMOZ1(RESUL(1),RESUL(2)) Q
TRAIT S DEV=RESUL(NUR) Q:DEV=""  F IT=1:1 S DEVI=$P(DEV,",",IT) Q:DEVI=""  S @ADR@(WHO,"INTERDIT",INT,DEVI)=1
END Q

