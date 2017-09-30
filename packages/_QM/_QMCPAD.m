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

;%QMCPAD^INT^1^59547,73876^0
QMCPAD ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SAVE(SAV,XMODE,SUP,IO,ERR,OK) 
 N ABORT
 S ABORT=""
 
 D KLK^%QMCPOZ(QUI)
 D SAV(SAV,XMODE,1,ERR,.OK)
 I '(OK) Q
 
 D SAV(SAV,XMODE,2,ERR,.OK)
 I '(OK) Q
 D FLUSH^%QMCPOZ(SUP,IO,.ABORT)
 I ABORT'=0,ABORT'="" S OK=0 D ADD^%VPRIN1(ERR,ABORT)
 Q
SAV(SAV,XMODE,PASSE,ERR,OK) 
 N NSAV,I,NOBJ,TYPOBJ,KILL
 S KILL=1
 
 
 
 S NSAV=$O(@SAV@(""))
 F I=0:0 Q:NSAV=""  D SAV1 S NSAV=$O(@SAV@(NSAV))
 
 I PASSE=1 D PASSE1("")
 Q
PASSE1(DESC) 
 N T
 S T=$C(9)
 D STOLK^%QMCPOZ(QUI,"PASSE1"_T_DESC)
 Q
SAV1 S TYPOBJ=$O(@SAV@(NSAV,""))
 F I=0:0 Q:TYPOBJ=""  D SAV2 S TYPOBJ=$O(@SAV@(NSAV,TYPOBJ))
 Q
SAV2 S NOBJ=$O(@SAV@(NSAV,TYPOBJ,""))
 F I=0:0 Q:NOBJ=""  D SAV3 S NOBJ=$O(@SAV@(NSAV,TYPOBJ,NOBJ))
 Q
SAV3 
 
 
 I TYPOBJ="INDH" D INDH1 Q
 I TYPOBJ="IND" D IND1 Q
 I TYPOBJ="TRT" D TRT1 Q
 Q
 
INDH1 N WHOIS1,QUI1,LISTE,WHOIS2,QUI2
 F I="WHOIS1","QUI1","LISTE","WHOIS2","QUI2" S @I=@SAV@(NSAV,TYPOBJ,NOBJ,I)
 D COPY^%QMCPAC(WHOIS1,QUI1,LISTE,WHOIS2,QUI2,KILL,XMODE,PASSE,ERR,OK)
 Q
 
IND1 N COPIE,DEFB,DEFI,LISTE
 F I="COPIE","DEFB","DEFI","LISTE" S @I=@SAV@(NSAV,TYPOBJ,NOBJ,I)
 D COPIND^%QMCPAC(COPIE,DEFB,DEFI,LISTE,KILL,XMODE,PASSE,ERR,OK)
 Q
 
TRT1 N LTRT,TRT,WHOIS1,QUI1,WHOIS2,QUI2,I
 S TRT=$$CONCAS^%QZCHAD(SAV,NSAV_","_TYPOBJ_","_NOBJ)
 S LTRT=$$CONCAS^%QZCHAD(TRT,"LTRT")
 F I="WHOIS1","QUI1","WHOIS2","QUI2" S @I=@SAV@(NSAV,TYPOBJ,NOBJ,I)
 D TTL^%QMCPSF1(WHOIS1,QUI1,LTRT,WHOIS2,QUI2,XMODE,PASSE)
 Q

