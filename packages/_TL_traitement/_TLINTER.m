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

;%TLINTER^INT^1^59547,74029^0
%TLINTER ;
 
 
 
 
 
 
 
 
 
 
 
 
 
CREER(TRT,COMM,ACTI,ANAL) G CRE
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ANAL(TRT) N NB Q $$^%TLIANAL(TRT,0,1,.NB)
ANAL2(TRT,VIS) N NB Q $$^%TLIANAL(TRT,VIS,1,.NB)
 
 
 
 
 
 
 
 
 
 
ACTIV(TRT,LISTE) Q $$ACTIVL^%TLIACTI(TRT,LISTE,0,0)
ACTIV2(TRT,LISTE) 
 N RES
 Q:'($$EXISTE^%TLINTER(TRT))
 Q:'($$EX^%QS0(LISTE))
 S RES=$$ACTIVL^%TLIACTI(TRT,LISTE,0,0)
 Q
 
 
 
 
 
 
 
ACTIVIND(TRT,BASE,IND) 
 N RES
 S RES=$$^%TLIACUN(TRT,BASE,IND,0,0)
 Q
EXISTE(TRT) Q $D(^[QUI]TTL(TRT))'=0
 
 
 
 
 
 
 
 
 
SUPP(TRT) D SUPP^%TLGEST(TRT) Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CRE Q:$$EXISTE(TRT) 1
 N I
 D SUPP(TRT)
 D CREER^%TLGEST(TRT)
 F I=1:1:$ZP(@COMM@("")) S ^[QUI]TTL(TRT,1,I)=@COMM@(I),^[QUI]TTL(TRT,1,I,"TETE")=$S($D(@COMM@(I,"TETE")):@COMM@(I,"TETE"),1:0)
 D MAJCOM^%TLGEST(TRT)
 F I=1:1:$ZP(@ACTI@("")) S ^[QUI]TTL(TRT,2,I)=@ACTI@(I),^[QUI]TTL(TRT,2,I,"TETE")=$S($D(@ACTI@(I,"TETE")):@ACTI@(I,"TETE"),1:0)
 I '(ANAL) D MAJ^%TLGEST(TRT,1,0,0) Q 0
 S I=$$ANAL(TRT) Q:I 0 Q 2
 
 
 
 
 
 
 
OKANA(T) 
 I ($D(^[QUI]TTL(T,"ANALYSE.CORRECTE"))#10)=0 Q 0
 Q ^[QUI]TTL(T,"ANALYSE.CORRECTE")
 
 
 
 
 
 
 
 
SETANA(T,OK) 
 I '($$EXISTE(T)) Q
 I $$EXISTE^%TLGEST(T) D SETANA^%TLGEST(T,OK)
 Q
 ;

