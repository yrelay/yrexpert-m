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

;TORQSL02^INT^1^59547,74875^0
TORQSL02 ;
 
 
 
 
 
 
 
 
CHOI() 
 D ^%QUAPAD("LISTE")
 S Y1=$$UN^%QUAPAGM
 
 Q:Y1="" 1
 Q Y1
IDF() 
 I '(DTM) N (WHOIS,QUI,L,R,IET,LATT) G IDF2
 
 D MEMX^%QCAMEM
 
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="WHOIS","QUI","L","R","IET","LATT","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K @(TAB125)
 
IDF2 
 D CURRENT^%IS,VARSYS^%QCSAP S L=$$CHOI I L=1 D:DTM RESTOR Q L
 
 I $$^%QCAZG("IET")=1 D POCLEPA^%VVIDEO,ATTRI(.LATT) Q:BBBB=1 BBBB
 S R=$$^%QSCALVA("L0",L,"BASE")
 D ^TORQSIDF(R,L)
 I '(DTM) G IDF3
 D RESTOR
IDF3 Q 2
 
ETU() 
 I '(DTM) N (WHOIS,QUI,R) G ETU2
 
 D MEMX^%QCAMEM
 
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="WHOIS","QUI","L","R","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K @(TAB125)
 
ETU2 
 D CURRENT^%IS,VARSYS^%QCSAP S L=$$CHOI I L=1 D:DTM RESTOR Q L
 
 D POCLEPA^%VVIDEO,ATTRI(.LATT) Q:BBBB=1 BBBB
 S R=$$^%QSCALVA("L0",L,"BASE")
 D T0^TORQSB01(L,.LATT)
 I '(DTM) G ETU3
 D RESTOR
ETU3 K ^TORQS($J)
 Q 2
 
IET() 
 N A,IET
 S IET=1,A=$$IDF Q:A=1 2
 I '(DTM) N (WHOIS,QUI,L,R,A,IET,LATT) G IET2
 
 D MEMX^%QCAMEM
 
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="WHOIS","QUI","L","R","A","IET","LATT","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K @(TAB125)
 
IET2 
 D CURRENT^%IS,VARSYS^%QCSAP
 D T0^TORQSB01(L,.LATT)
 I '(DTM) G IET3
 D RESTOR
IET3 Q 2
 
ATTRI(LATT) 
 N ZLILA S BBBB=$$MES^%QMLILL($$^%QZCHW("Liste d'attributs implicites a transferer")_" :",.ZLILA) Q:BBBB=1
 
ADR N ADR,I,ATT,OATT
 I ZLILA="" S LATT="" D ^%VZEAVT($$^%QZCHW("OK pas de liste d'attributs")) Q
 I ZLILA="*" S LATT="*" Q
 S ADR=$$LIST^%QMLILA(ZLILA)
 I ADR="" S LATT="*" Q
 S LATT="LISTE",OATT=$O(@ADR@(""))
 F I=0:0 Q:(OATT="")!(OATT]"A")  S:@ADR@(OATT)'="" LATT(@ADR@(OATT))="" S OATT=$O(@ADR@(OATT))
 Q
RESTOR 
 
 
 D RMEMX^%QCAMEM
 D CURRENT^%IS,VARSYS^%QCSAP
 Q

