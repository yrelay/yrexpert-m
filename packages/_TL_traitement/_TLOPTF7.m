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

;%TLOPTF7^INT^1^59547,74030^0
%TLOPTF7 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
IMPRETAT(IDEB,NBREG) 
 D:V(IDEB+2)="E" IMP^%QSETIMP(V(IDEB),V(IDEB+1),1,0,1,V(IDEB+3))
 D:V(IDEB+2)="T" IMP^%QSETTAB(V(IDEB),V(IDEB+1),1,1,V(IDEB+3))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
IMPRHST(IDEB,NBREG) 
 S GLH=$$ADRHIS^%HXIHITU
 S:V(IDEB+1)="g" V(IDEB+1)="G" S:V(IDEB+1)="s" V(IDEB+1)="S" I "GS"'[V(IDEB+1) S V(IDEB+1)="S"
 I '($$^%EDPRLG) Q
 D INIT^%EDCENVL
 I V(IDEB+2)=$C(0) D IMPRT^%HXIHIT2(GLH,V(IDEB),V(IDEB+1),"") Q 1
 D IMPRT^%HXIHIT2(GLH,V(IDEB),V(IDEB+1),V(IDEB+2)) Q 1
 
 
 
 
 
 
 
 
 
 
IMPRLST(IDEB,NBREG) 
 N ATR,PCH,LILA,OA
 I V(IDEB+1)=$C(0) D EXT^%QS0LEC2(V(IDEB),"",0,"ceux de la liste") Q 1
 S OA=$P(LILA,"(",2) I OA'="" S OA=$P(OA,")")
 I $$LEX^%LXSTOCK($$GETLBLAN^%VTLBLAN($P(LILA,"(")),.PCH)=1 S ATR=1,LILA=PCH_$S(OA="":"",1:" ("_OA_")")
 D EXT^%QS0LEC2(V(IDEB),"",0,"ceux de la liste") Q 1
 Q 1
 ;
 ;

